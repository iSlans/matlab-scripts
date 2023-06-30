format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

table = [
    0 15 17 35 19
    0 0 21 36 22
    0 0 0 23 20
    0 0 0 0 18
    0 0 0 0 0
    ];

% -------------------------------- assignment -------------------------------- %

% [assignment_x, v] = assignment(table + table' + eye(width(table)) * 10000);
% assignment_x = reshape(assignment_x, size(table));
% g = digraph(assignment_x);
% plot(g)

%%
% -------------------------------- evaluations ------------------------------- %

% root = 5
% [g, v] = ktree(table, root)
% plot(g)

% [x, v] = nearestNode(table, 3, isSymmetric = true)

%%
% ----------------------------- branch and bound ----------------------------- %

decision_order = [
    1 2
    1 4
    2 4
    ];

KTREE_ROOT = 5;
NEARESTNODE_ROOT = 3;

SymmetricTSPBranchAndBound(table, NEARESTNODE_ROOT, KTREE_ROOT, decision_order)
