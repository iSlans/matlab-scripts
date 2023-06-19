c = [30 30 35 35];
A = [
    5 0 7 0 % 119
    0 5 0 7 % 91
    1 1 0 0 % 23
    0 0 1 1 % 15
    -1 0 0 0
    0 -1 0 0
    0 0 -1 0
    0 0 0 -1
    ];
b = [119 91 23 15 0 0 0 0];

% linprog(-c, A, b)

% primalSimplex(c, A, b, [1 2 3 6])

c =- [30 30 35 35 0 0 0 0];
A = [
    5 0 7 0 1 0 0 0
    0 5 0 7 0 1 0 0
    1 1 0 0 0 0 1 0
    0 0 1 1 0 0 0 1
    ];
b = [119 91 23 15];
ub = [0 0 0 0 0 0 0 0];

% gomory(c, A, b)

% Ab = [5 0 7 0
%     0 5 0 0
%     1 1 0 0
%     0 0 1 1]
% An = [0 1 0 0
%     7 0 1 0
%     0 0 0 1
%     1 0 0 0]

% Ab \ An

% [-7/5, 0, -1/5, 1
%     7/5, 0, 1/5, 0
%     1, 1/7, 1/7, -5/7
%     0, -1/7, -1/7, 5/7]

% c = [30 30 35 35];
% A = [
%     5 0 7 0
%     0 5 0 7
%     1 1 0 0
%     0 0 1 1
%     ];
% b = [119 91 23 15];

% intlinprog(-c, [1 2 3 4], A, b, [], [], [0 0 0 0], [])

% --------------------------------------------------------------------------%

table = [
    0 23 18 17 21
    0 0 22 16 16
    0 0 0 20 19
    0 0 0 0 14
    0 0 0 0 0
    ];

% assignment(table + table' + eye(width(table)) * 10000)

% [g, v] = ktree(table, 2)
% plot(g)

% [x, v] = relaxedSymmetricTSP(table)

% x = reshape(x, 5, 5)

% g = graph(x, 'upper')

% [x, v] = nearestNode(table, 2, "isSymmetric", true)

d = [
    2 4
    2 5
    4 5
    ];

% SymmetricTSPBranchAndBound(table, 2, 2, d)

b = [-2 -4 -6 5 6 1];
ed = [
    1 2 3 7
    1 3 5 7
    2 3 4 5
    2 4 4 12
    2 6 5 4
    3 4 4 5
    3 5 10 7
    3 6 5 10
    4 6 3 11
    5 6 7 9
    ];
t = [
    1 3
    2 3
    3 5
    4 6
    5 6
    ];

u = [3 4];

% flowSimplex(b, ed, t, u)

% dijkstra(ed(:, [1 2 3]), 1)

% b = [-5 1 1 1 1 1]
% flowSimplex(b, ed, t, u)

% g = digraph(ed(:, 1), ed(:, 2), ed(:, 3));
% plot(g.shortestpathtree(1))
% g.shortestpathtree(1).Edges

% % g = digraph(ed(:, 1), ed(:, 2), ed(:, 4));

% % [maxf, gg, ns, nd] = g.maxflow(1, 6)
% fordFulkerson(ed(:, [1 2 4]), 1, 6)

%%

syms x [2 1]

minf = -2 * x1 ^ 2 -6 * x1 * x2 -10 * x1 - 3 * x2;

% polygonContraints([
%     -2 2
%     4 2
%     4 0
%     0 -3
%     ])

A = [
    -5 -2
    3 -4
    1 0
    0 1
    ];
b = [6 12 4 2]';

% minFrankWolfe(x, minf, A, b, [1 2])
format rat
% minGradientProjection(x, minf, A, b, [1 2])

% RicOp.gradienteProiettato(minf,A,b, [1 ; 2],1)

% gradient(minf)

g = A * x - b;

LKKTsystem(x, minf, g);
% RicOp.LKKT(minf, g);

% % fsurf(matlabFunction(minf))

plotSurfOnContraints(minf, g, fmesh = true)

eig(hessian(x2 - x1 ^ 2))
