logging info

c = [-7 1];
b = [4 -6 5 22 6 16];
A = [
    -3 2
    -1 -3
    0 1
    3 2
    1 0
    2 -1
    ];

i = [2, 5];

% baseSolutionProblem(c, A, b, [4 5]);
% baseSolutionProblem(c, A, b, [2 5]);
% primalSimplex(c, A, b, i);

c = [2 1];
b = [3 -7 5 22 14 15];
A = [
    -1 -1 0 3 2 2
    1 -4 1 2 1 -2
    ];
A = A';

% baseSolutionProblem(c, A, b, [3 4]);
% baseSolutionProblem(c, A, b, [1 5]);
% dualSimplex(c, A, b, [4 6]);

c = [17 28 16 3 3 19]
A = [
    -6 7 4 -2 -2 2
    10 2 -3 -4 2 -1
]
b = [2 1]
logging debug
dualSimplex(b, A, c, [5 6]);
