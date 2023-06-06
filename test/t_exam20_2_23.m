% max 14x + 20y +16z
% 1x + 3y +2z <= 510
% 1x + 2y +4z <= 400
% 2x + 1y +1z <= 180
% x,y,z >= 0

c = [14 20 16];
A = [
    1 3 2
    1 2 4
    2 1 1
    -1 0 0
    0 -1 0
    0 0 -1
    ];
b = [510 400 180 0 0 0];

% primalSimplex(c, A, b, [4 5 6])

% Primal Simplex step 1
%              key                   value
%     ___________________    ___________________
%      base                   4 5 6
%      x                      0 0 0
%      y                      0 0 0 -14 -20 -16
%      f function value       0
%      h exiting index        4
%      k entering index       3
%      r ratios               510 400 90
%      new base               3 5 6

c =- [14 20 16 0 0 0];
A = [
    1 3 2 1 0 0
    1 2 4 0 1 0
    2 1 1 0 0 1
    ];
b = [510 400 180];

% logging debug
% gomory(c, A, b)
% Gomory cuts, simplified:
%   x1 <= 1
% x2 <= 154
%  x3 <= 22

c =- [14 20 16];
A = [
    1 3 2
    1 2 4
    2 1 1
    ];
b = [510 400 180];
lb = [0 0 0];
ub = [];

% x = intlinprog(c, [1 2 3], A, b, [], [], lb, ub)
% x =
%        2
%      156
%       20

% ---------------------------------------------------------------------------- %
%                                      es2                                     %
% ---------------------------------------------------------------------------- %

A = [
    0 29 24 67 47
    0 0 18 94 61
    0 0 0 23 26
    0 0 0 0 20
    0 0 0 0 0
    ];
d = [
    3 4
    2 4
    4 5
    ];

% g = graph(A, 'upper')
% [cycl, edgecycl] = g.allcycles("MinCycleLength", g.numnodes)
% arrayfun(@(cell) sum(g.Edges.Weight(cell{1})), edgecycl)

% k = ktree(A, 2)

% SymmetricTSPBranchAndBound(A, 2, 2, d)
% nearestNode solution:
% cycle : 2 3 4 5 1 2
% value: 137

% ktree
% 12 13 23  34 45
% degree node3 = 3
% degree node5 = 1

% P01 [114 137] branch
% P11 [117 137] branch
% P12 [114 137] branch
% P21 [117 137] branch
% P22 [182 137] cut subLowerEvalValue >= upperEvalValue
% P23 [114 137] branch
% P24 [179 137] cut subLowerEvalValue >= upperEvalValue
% P31 void
% P32 [117 137] branch
% P35 [120 137] branch
% P36 [114 137] branch

% ---------------------------------------------------------------------------- %
%                                      es3                                     %
% ---------------------------------------------------------------------------- %

b = [-3 -6 -6 6 3 6];
ed = [
    1 2 8 7
    1 4 8 8
    1 5 3 10
    2 3 6 11
    2 4 5 9
    3 4 8 9
    4 5 5 6
    4 6 10 8
    5 6 9 10
    ];
t = [
    1 2
    2 3
    2 4
    4 5
    4 6
    ];
u = [3 4];

% flowSimplex(b, ed, t, u)
% flow = [3 0 0 3 6 9 3 6 0]
% potential = 0 8 14 13 18 23
% flow not degenerate
% potential not degen
% entering 1 4
% exiting 1 2
% edgeTable =
%   9x11 table
%     edge_ij    src    dst    cost    capacity    partition    newPartition    flow    reducedCost    cycle    theta
%     _______    ___    ___    ____    ________    _________    ____________    ____    ___________    _____    _____
%     1    2      1      2       8         7       " T     "        "L"          3          0          "C-"        3
%     1    4      1      4       8         8       "     L "        "T"          0          -5         "C+"        8
%     1    5      1      5       3        10       "     L "        "L"          0          -15        ""        NaN
%     2    3      2      3       6        11       " T     "        "T"          3          0          ""        NaN
%     2    4      2      4       5         9       " T     "        "T"          6          0          "C-"        6
%     3    4      3      4       8         9       "   U   "        "U"          9          9          ""        NaN
%     4    5      4      5       5         6       " T     "        "T"          3          0          ""        NaN
%     4    6      4      6      10         8       " T     "        "T"          6          0          ""        NaN
%     5    6      5      6       9        10       "     L "        "L"          0          4          ""        NaN
% newT =
%        1              4
%        2              3
%        2              4
%        4              5
%        4              6
% newU =
%        3              4

% b = [-5 1 1 1 1 1];
% flowSimplex(b, ed, t, u)
% flow = 2 1 2 1 0 0 0 0 1

% g = digraph(ed(:, 1), ed(:, 2), ed(:, 3));
% g.shortestpathtree(1).Edges
% EndNodes    Weight
%     ________    ______
%      1    2       8
%      1    4       8
%      1    5       3
%      2    3       6
%      5    6       9

% g = digraph(ed(:, 1), ed(:, 2), ed(:, 4));
% [val, graf, ns, nd] = g.maxflow(1, 6)

% maxflow value 18
% Ns 12345
% Nd 6

% ---------------------------------------------------------------------------- %
%                                      es4                                     %
% ---------------------------------------------------------------------------- %

syms x [2 1]

points = [
    2 0
    5 3
    1 5
    -1 1
    ]

polygonContraints(points)

maxf = -2 * x1 ^ 2 - 2 * x1 * x2 -4 * x2 ^ 2 - 9 * x2;
minf = -maxf;
A = [
    1 -1
    1 2
    -1 -3
    -2 1
    ];
b = [2 11 -2 3]';

% minFrankWolfe(x, f, A, b, [0 2/3])
% yk =
%       -1
%        1
% tk =
%        1
% dk =
%       -1
%        1/3
% new_xk =
%       -1
%        1

% minGradientProjection(x, minf, A, b, [0 2/3])
% V =
%        1              3
% H =
%        9/10          -3/10
%       -3/10           1/10
% dk =
% -31/10
%  31/30

% tk =
%        5/16
% new_xk =
%       31/32
%       11/32

g = A * x - b(:);

% RicOp.LKKT(minf, g)

% LKKTsystem(x, maxf, g)
% ans =
%    6x7 table
% lambda1    lambda2    lambda3    lambda4     x1       x2      f_value
% _______    _______    _______    _______    _____    _____    ________
%  0          116/5     0           23/5      1        5        -157
%  3          23        0           0         5        3        -143
%  0          181/8     0           0         31/8     57/16    -4495/32
%  0          0         -4          3         -1       1        -13
%  11/4       0         -21/4       0         2        0        -8
%  0          0         -73/16      0         31/32    11/32    -391/64

% domain : regular polyhedron

% subs(maxf, x, [2; 0]) % -8
% subs(maxf, x, [5; 3]) % -143
% subs(maxf, x, [1; 5]) % -157
% subs(maxf, x, [-1; 1]) % -13
