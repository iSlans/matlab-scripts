A = [
    0 26 20 24 19
    0 0 34 23 22
    0 0 0 27 21
    0 0 0 0 32
    0 0 0 0 0
    ];

table = A + eye(size(A, 1)) * 1e+4;

% ---------------------------------------------------------------------------- %
%                           BUILD the problem struct                           %
% ---------------------------------------------------------------------------- %

problem = struct();
problem.originalTable = A;
problem.allWeightTable = table;
problem.lb = zeros(numel(A), 1);
problem.ub = ones(numel(A), 1);
problem.decision_priority = sub2ind(size(A), [3 4], [4 5]);

% ---------------------------------------------------------------------------- %
%                             find upper evaluation                            %
% ---------------------------------------------------------------------------- %

[upperEvalSolution, upperEvalValue] = nearestNode(A, 3, "isSymmetric", true);

% ---------------------------------------------------------------------------- %
%                                Branch & Bound                                %
% ---------------------------------------------------------------------------- %

[sol, val] = minBranchAndBound( ...
    problem, ...
    upperEvalSolution, ...
    upperEvalValue, ...
    @isProblemInadmissible, ...
    @lowerEvaluationFunction, ...
    @isLowerEvalSolutionAdmissible, ...
    @branchingFunction)

% ---------------------------------------------------------------------------- %
%                             DEFINE b&b functions                             %
% ---------------------------------------------------------------------------- %

function isInadmissible = isProblemInadmissible(problem)

    % define the function to be used in branch&bound

end

function [solution, value] = lowerEvaluationFunction(problem)

    % define the function to be used in branch&bound

end

function isAdmissible = isLowerEvalSolutionAdmissible(solution)

    % define the function to be used in branch&bound

end

function childProblems = branchingFunction(problem)

    % define the function to be used in branch&bound

end
