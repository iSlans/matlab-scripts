A = [
    0 26 28 32 36
    0 0 31 27 22
    0 0 0 24 18
    0 0 0 0 19
    0 0 0 0 0
    ];

A = [
    0 24 21 20 9
    0 0 23 40 13
    0 0 0 30 25
    0 0 0 0 28
    0 0 0 0 0
    ];

A = [
    0 17 10 20 35 10000
    0 0 11 21 10000 15
    0 0 0 10000 6 7
    0 0 0 0 29 30
    0 0 0 0 0 26
    0 0 0 0 0 0
    ];

A = A + A' + eye(size(A, 1)) * 1e+4;
indexes = reshape(1:numel(A), size(A));

[p, v] = nearestNode(A, 4);
% minBranchAndBound(A, @lowerEval, p, v, @checkLowerAdmissible, [18, 17, 24])

sol = branchAndBound(A, @lowerEval, p, v, @checkLowerAdmissible, [indexes(5, 6) indexes(2, 6) indexes(3, 6)])

function [tree, val] = lowerEval(table)
    [tree, val] = ktree(table, 3);
end

function [bool] = checkLowerAdmissible(tree)
    % tree.allcycles{:}
    cycles = tree.allcycles("MinCycleLength", tree.numnodes);

    bool = (length(cycles) == 1);
end
