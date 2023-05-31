% ------------------------------------ TSP ----------------------------------- %

function [upperEvalSolution, upperEvalValue] = branchAndBound( ...
        table, ...
        lowerEvaluationFunction, ...
        upperEvalSolution, upperEvalValue, ...
        isLowerEvalSolutionAdmissible, ...
        isProblemInadmissible, ...
        decision_priority)

    MAX_STEPS = 10;

    % all_decisions = 1:numel(table);
    % all_decisions(decision_priority) = [];
    % all_decisions = [decision_priority all_decisions];
    all_decisions = decision_priority;

    x_lowerbounds = zeros(size(table));
    x_upperbounds = ones(size(table));

    problem = struct();
    problem.table = table;
    problem.lowerEvalValue = lowerEvalValue;
    % problem.upperEvalValue = upperEvalValue; % absolute upperEvalValue
    problem.lb = x_lowerbounds(:);
    problem.ub = x_upperbounds(:);
    problem.decision_priority = all_decisions;

    % --------------------------- tree branch and bound -------------------------- %

    queue = queueFIFO();
    queue.push(problem);

    % while ~queue.isempty
    for step = 1:MAX_STEPS

        step

        pause

        if queue.isempty
            disp("empty queue")
            break
        end

        subproblem = queue.pop();

        printProblem(subproblem)

        % ------------------------------ 1st branch cut ------------------------------ %
        % by checking if the subproblem is not admissible

        % oldlog = logging;
        % % logging warning
        % [sol, sol_value] = assignmentSymmetric(subproblem.table, subproblem.lb, subproblem.ub);

        % logging(oldlog)

        % if isempty(sol)
        %     % not admissible --> void --> cut branch
        %     disp("empty subproblem")

        %     continue
        % end

        if isProblemInadmissible(subproblem)
            % not admissible --> void --> cut branch
            disp("subproblem inadmissible")
            continue
        end

        disp("subproblem seems admissible")

        % -------------------------- check lower evaluation -------------------------- %

        [subLowerEvalSolution, ~] = lowerEvaluationFunction(subproblem.table);

        plot(subLowerEvalSolution, "EdgeLabel", subLowerEvalSolution.Edges.Weight)

        sol = triu(full(subLowerEvalSolution.adjacency));
        sol = logical(sol(:));
        subLowerEvalValue = sum(table(sol));

        upperEvalValue
        subLowerEvalValue

        subproblem.lowerEvalValue = subLowerEvalValue;

        if subLowerEvalValue >= upperEvalValue
            % cut branch (by not adding child node to queue)
            disp("cut 2")

            continue
        end

        if isLowerEvalSolutionAdmissible(subLowerEvalSolution)

            if subLowerEvalValue < upperEvalValue
                upperEvalValue = subLowerEvalValue;
                upperEvalSolution = subLowerEvalSolution;

                % cut
                disp("cut 3")

                continue
            end

        end

        % ----------------------------- no cut, branching ---------------------------- %

        disp("branching")

        if isempty(subproblem.decision_priority)
            continue
        end

        x_branching = subproblem.decision_priority(1);
        subproblem.decision_priority(1) = [];

        % child problems with x_branching = 0 | 1

        % x value = 0, so for TSP is setting edge unselectable, with a heavy weight
        t = subproblem.table;
        t(x_branching) = nan;
        t = (t + t') / 2;
        t(isnan(t)) = 1e+4;
        subproblem.table = t;
        subproblem.lb(x_branching) = 0;
        subproblem.ub(x_branching) = 0;

        queue.push(subproblem);

        % x value = 1, so for TSP is setting edge a must choice, with a weight = 0
        t = subproblem.table;
        t(x_branching) = nan;
        t = (t + t') / 2;
        t(isnan(t)) = 0.1;
        subproblem.table = t;
        subproblem.lb(x_branching) = 1;
        subproblem.ub(x_branching) = 1;

        queue.push(subproblem);

    end

end

function printarr(arr)
    fprintf("%d ", arr)
    fprintf("\n")
end

function printProblem(p)

    disp("---------------------------------")
    disp("subproblem details")
    disp("---------------------------------")

    t = formattedDisplayText(p.table, "NumericFormat", "shortG");

    fprintf("%s", t)
    p.lowerEvalValue
    printarr(p.lb)
    printarr(p.ub)
    p.decision_priority

    x = p.lb + p.ub;
    x = reshape(x, size(p.table));
    x(x == 1) = nan;
    x(x == 2) = 1;
    x
    disp("-------------------------------")

end
