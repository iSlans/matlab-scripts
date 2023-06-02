A = [
    0 26 20 24 19
    0 0 34 23 22
    0 0 0 27 21
    0 0 0 0 32
    0 0 0 0 0
    ];

A = A + eye(size(A, 1)) * 1e+4;
indexes = reshape(1:numel(A), size(A));

[p, v] = nearestNode(A, 3, "isSymmetric", true);

[sol, val] = branchAndBoundOLD(A, @lowerEval, p, v, ...
    @checkLowerAdmissible, ...
    @isProblemInadmissible, ...
    @binaryBranch, ...
    [indexes(3, 4) indexes(4, 5)] ...
)

function [tree, val] = lowerEval(table)
    [tree, val] = ktree(table, 4);
end

function [bool] = checkLowerAdmissible(tree)
    % tree.allcycles{:}
    cycles = tree.allcycles("MinCycleLength", tree.numnodes);

    bool = (length(cycles) == 1);
end

function [inadmissible] = isProblemInadmissible(problem)

    oldlog = logging;
    logging warning
    [sol, sol_value] = assignmentSymmetric(problem.table, problem.lb, problem.ub);
    logging(oldlog)

    if isempty(sol)
        disp("grade contraints violated")
        inadmissible = true;
        return
    end

    edges = problem.lb & problem.ub;
    edges = reshape(edges, size(problem.table));

    g = graph(edges, "upper");

    minorCycles = g.allcycles("MaxCycleLength", size(problem.table, 1) - 1);

    if ~isempty(minorCycles)
        inadmissible = true;
        return
    end

    inadmissible = false;

end

function childProblems = binaryBranch(problem)

    childProblems = {};

    if isempty(problem.decision_priority)
        return
    end

    x_branching = problem.decision_priority(1);
    problem.decision_priority(1) = [];

    % child problems with x_branching = 0 | 1

    % x value = 0, so for TSP is setting edge unselectable, with a heavy weight
    t = problem.table;
    t(x_branching) = nan;
    t = (t + t') / 2;
    t(isnan(t)) = 1e+4;
    problem.table = t;
    problem.lb(x_branching) = 0;
    problem.ub(x_branching) = 0;

    childProblems{1} = problem;

    % x value = 1, so for TSP is setting edge a must choice, with a weight = 0
    t = problem.table;
    t(x_branching) = nan;
    t = (t + t') / 2;
    t(isnan(t)) = 0.1;
    problem.table = t;
    problem.lb(x_branching) = 1;
    problem.ub(x_branching) = 1;

    childProblems{2} = problem;
end
