format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

table = [
    0 23 18 17 21
    0 0 22 16 16
    0 0 0 20 19
    0 0 0 0 14
    0 0 0 0 0
    ];

% -------------------------------- assignment -------------------------------- %

% [assignment_x, v] = assignment(table + table' + eye(width(table)) * 10000);
% assignment_x = reshape(assignment_x, size(table));
% g = digraph(assignment_x);
% plot(g)

%%
% -------------------------------- evaluations ------------------------------- %

% root = 2
% [g, v] = ktree(table, root)
% plot(g)

% [x, v] = nearestNode(table, root, isSymmetric = true)

%%
% ----------------------------- branch and bound ----------------------------- %

decision_order = [
    2 4
    2 5
    4 5
    ];

KTREE_ROOT = 2;
NEARESTNODE_ROOT = 2;

% SymmetricTSPBranchAndBound(table, NEARESTNODE_ROOT, KTREE_ROOT, decision_order)
