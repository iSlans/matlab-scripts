% A = [
%     0 26 20 24 19
%     0 0 34 23 22
%     0 0 0 27 21
%     0 0 0 0 32
%     0 0 0 0 0
%     ];

% SymmetricTSPBranchAndBound(A, 3,4)

function [sol, val] = SymmetricTSPBranchAndBound(table, NEARESTNODE_ROOT, KTREE_ROOT, decision_priority)

    arguments
        table (:, :)
        NEARESTNODE_ROOT
        KTREE_ROOT
        decision_priority
    end

    % ---------------------------------------------------------------------------- %
    %                           BUILD the problem struct                           %
    % ---------------------------------------------------------------------------- %
    % define any field used in the b&b functions

    problem = struct();
    problem.id = 1;
    problem.name = [0 1];
    problem.originalTable = table;
    problem.ktreeTable = table;
    problem.assignmentTable = table + eye(size(table, 1)) * 1e+4;
    problem.lb = zeros(numel(table), 1);
    problem.ub = ones(numel(table), 1);
    problem.decision_priority = decision_priority;

    % ---------------------------------------------------------------------------- %
    %                             find upper evaluation                            %
    % ---------------------------------------------------------------------------- %

    [upperEvalSolution, upperEvalValue] = nearestNode(table, NEARESTNODE_ROOT, "isSymmetric", true);

    log.info("nearestNode solution: \n")
    log.info("cycle : ")
    log.info("%d ", upperEvalSolution)
    log.info("\nvalue: %d \n", upperEvalValue)

    % ---------------------------------------------------------------------------- %
    %                                Branch & Bound                                %
    % ---------------------------------------------------------------------------- %

    [sol, val] = minBranchAndBound(problem, ...
        upperEvalSolution, ...
        upperEvalValue, ...
        @isProblemInadmissible, ...
        @lowerEvaluationFunction, ...
        @isLowerEvalSolutionAdmissible, ...
        @branchingFunction);

    if isa(sol, "graph")
        sol = sol.cyclebasis{1};
    end

    % ---------------------------------------------------------------------------- %
    %                             DEFINE b&b functions                             %
    % ---------------------------------------------------------------------------- %

    function isInadmissible = isProblemInadmissible(problem)

        problem

        table = problem.assignmentTable;
        lb = problem.lb;
        ub = problem.ub;

        old_logging = logging;
        logging warning
        [relaxed_sol, relaxed_sol_value] = assignmentSymmetric(table, lb, ub);
        logging(old_logging)

        if isempty(relaxed_sol)
            disp("grade contraints violated")
            isInadmissible = true;
            return
        end

        edges = reshape(lb & ub, size(table));
        g = graph(edges, "upper");

        minorCycles = g.allcycles("MaxCycleLength", size(table, 1) - 1);

        if ~isempty(minorCycles)
            isInadmissible = true;
            return
        end

        isInadmissible = false;

    end

    function [solution, value] = lowerEvaluationFunction(problem)
        % solution: graph
        % value: number

        % this function executed after isProblemInadmissible
        % so can be sure problem is not inadmissible and no grade contraints is violated

        % How to tell ktree a edge must / must not be taken?
        % must: make edge weight very low
        % must not: make edge weight very high (or 0, so for matlab graph it doesn't even exist )

        % ktree_root = 4;
        [solution, ~] = ktree(problem.ktreeTable, KTREE_ROOT);

        % the solution is found on modified weigths,
        % so to find the value need to appraise it from the original table
        sol = logical(triu(solution.adjacency));
        value = sum(problem.originalTable(sol));

        t = zeros(size(problem.originalTable));
        t(sol) = problem.originalTable(sol);
        g = graph(t, "upper");

        nexttile
        plot(g, "EdgeLabel", g.Edges.Weight)
        title(sprintf("ID: P%d%d", problem.name), sprintf("Value = %d", value))
        % log.debug("%s", formattedDisplayText(solution.allcycles))

    end

    function isAdmissible = isLowerEvalSolutionAdmissible(solution)

        % the input here is the one returned from lowerEvaluationFunction
        % solution: graph
        % isAdmissible: boolean

        cycles = solution.allcycles("MinCycleLength", solution.numnodes);
        isAdmissible = (length(cycles) == 1);

    end

    function childProblems = branchingFunction(problem)

        childProblems = {};

        if isempty(problem.decision_priority)
            return
        end

        convertIndices = @(indices) sub2ind(size(problem.originalTable), indices(1), indices(2));

        name = problem.name;

        x_branching = problem.decision_priority(1, :);
        x_branching = convertIndices(x_branching);
        problem.decision_priority(1, :) = [];

        % set x value = 0,
        % for TSP is setting edge unselectable, with a heavy weight
        problem.assignmentTable(x_branching) = 1e+4;
        problem.ktreeTable(x_branching) = 0;
        problem.lb(x_branching) = 0;
        problem.ub(x_branching) = 0;

        problem.name = [name(1) + 1, name(2) * 2 - 1];
        problem.id = problem.id + 1;

        childProblems{1} = problem;

        % x value = 1, so for TSP is setting edge as must choice, with a weight = 0
        problem.assignmentTable(x_branching) = 0;
        problem.ktreeTable(x_branching) = 1e-4;
        problem.lb(x_branching) = 1;
        problem.ub(x_branching) = 1;

        problem.name = [name(1) + 1, name(2) * 2];
        problem.id = problem.id + 1;

        childProblems{2} = problem;

    end

end
