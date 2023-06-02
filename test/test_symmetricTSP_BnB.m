% ---------------------------------------------------------------------------- %
%                                    6-6-22                                    %
% ---------------------------------------------------------------------------- %

A = [
    0 26 20 24 19
    0 0 34 23 22
    0 0 0 27 21
    0 0 0 0 32
    0 0 0 0 0
    ];

vars = [
    3 4
    4 5
    ];

nearestNode_root = 3;
ktree_root = 4;

% figure
% [sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)

% ---------------------------------------------------------------------------- %
%                                    9-1-23                                    %
% ---------------------------------------------------------------------------- %

% A = [
%     0 20 24 21 32
%     0 0 17 30 19
%     0 0 0 22 18
%     0 0 0 0 25
%     0 0 0 0 0
%     ];

% vars = [
%     2 3
%     2 4
%     2 5
%     ];

% ktree_root = 5;
% nearestNode_root = 1;

% figure(Name = "ktree solutions")
% [sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)

% ---------------------------------------------------------------------------- %
%                                    30-1-23                                   %
% ---------------------------------------------------------------------------- %

A = [
    0 30 35 32 25
    0 0 28 33 26
    0 0 0 24 16
    0 0 0 0 12
    0 0 0 0 0
    ];

vars = [
    3 4
    3 5
    4 5
    ];

ktree_root = 5;
nearestNode_root = 4;

% figure(Name = "ktree solutions")
% [sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)

% ---------------------------------------------------------------------------- %
%                                    20-2-23                                   %
% ---------------------------------------------------------------------------- %

A = [
    0 29 24 67 47
    0 0 18 94 61
    0 0 0 23 26
    0 0 0 0 20
    0 0 0 0 0
    ];

vars = [
    3 4
    2 4
    4 5
    ];

ktree_root = 2;
nearestNode_root = 2;

% figure(Name = "ktree solutions")
% [sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)

% ---------------------------------------------------------------------------- %
%                                   17-2-2020                                  %
% ---------------------------------------------------------------------------- %

A = [
    0 10 41 62 92
    0 0 27 54 56
    0 0 0 11 13
    0 0 0 0 94
    0 0 0 0 0
    ];

vars = [
    4 5
    3 5
    1 5
    ];

ktree_root = 2;
nearestNode_root = 5;

% figure(Name = "ktree solutions")
% [sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)

% ---------------------------------------------------------------------------- %
%                                   12-9-2019                                  %
% ---------------------------------------------------------------------------- %

A = [
    0 20 24 31 12
    0 0 29 28 8
    0 0 0 26 22
    0 0 0 0 21
    0 0 0 0 0
    ];

vars = [
    1 2
    1 5
    2 5
    ];

ktree_root = 5;
nearestNode_root = 4;

figure(Name = "ktree solutions")
[sol, value] = SymmetricTSPBranchAndBound(A, nearestNode_root, ktree_root, vars)
