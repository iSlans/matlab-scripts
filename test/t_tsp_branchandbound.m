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

[sol, val] = branchAndBound(A, @lowerEval, p, v, ...
    @checkLowerAdmissible, ...
    @isProblemInadmissible, ...
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

function [bool] = isProblemInadmissible(problem)
    oldlog = logging;
    % logging warning
    [sol, sol_value] = assignmentSymmetric(problem.table, problem.lb, problem.ub);
    logging(oldlog)

    if isempty(sol)
        disp("grade contraints violated")
        bool = false;
        return
    end

end
