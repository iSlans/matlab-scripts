function [upperEvalSolution, upperEvalValue] = minBranchAndBound( ...
        problem, ...
        upperEvalSolution, ...
        upperEvalValue, ...
        isProblemInadmissible, ...
        lowerEvaluationFunction, ...
        isLowerEvalSolutionAdmissible, ...
        branchingFunction)

    %
    % Doc by GPT :)
    %
    % problem: the root problem to be solved.
    % upperEvalSolution: the current best solution
    % upperEvalValue: the current value of best solution.
    % lowerEvaluationFunction: a function that evaluates the lower bound of a given problem.
    % isLowerEvalSolutionAdmissible: a function that checks whether a given lower bound solution is admissible or not.
    % isProblemInadmissible: a function that checks whether a given problem is inadmissible or not.
    % branchingFunction: a function that generates child problems from a given problem to perform branching.

    arguments
        problem struct
        upperEvalSolution
        upperEvalValue
        isProblemInadmissible
        lowerEvaluationFunction
        isLowerEvalSolutionAdmissible
        branchingFunction
    end

    queue = queueFIFO();
    queue.push(problem);

    step = 0;

    while ~queue.isempty

        step = step + 1;

        log.info("\npaused, press any key to proceed with step %d\n", step)

        pause

        subproblem = queue.pop();

        % ---------------------- inadmissible problem branch cut --------------------- %

        if isProblemInadmissible(subproblem)
            log.info("cut subproblem inadmissible\n")
            continue
        end

        log.info("subproblem seems admissible\n")

        % -------------------------- check lower evaluation -------------------------- %

        [subLowerEvalSolution, subLowerEvalValue] = lowerEvaluationFunction(subproblem);

        log.info("\n")
        log.info("subproblem lower value: %d \n", subLowerEvalValue)
        log.info("current upper value: %d \n", upperEvalValue)
        log.info("\n")

        if subLowerEvalValue >= upperEvalValue
            log.info("cut subLowerEvalValue >= upperEvalValue\n")
            continue
        end

        if subLowerEvalValue < upperEvalValue ...
                && isLowerEvalSolutionAdmissible(subLowerEvalSolution)

            upperEvalValue = subLowerEvalValue;
            upperEvalSolution = subLowerEvalSolution;

            log.info("cut better admissible solution found\n")
            continue
        end

        % ----------------------------- no cut, branching ---------------------------- %

        log.info("branching\n")

        childProblems = branchingFunction(subproblem);

        for i = 1:length(childProblems)
            queue.push(childProblems{i});
        end

    end

end
