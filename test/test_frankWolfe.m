polygonContraints([
    -2 0
    0 2
    2 0
    0 -2
    ])
% - x - y <= 2
% x - y <= 2
% x + y <= 2
% y - x <= 2

syms x [2 1]
f = (x1 + 2) ^ 2 + (x2 - 2) ^ 2;
A = [
    -1 -1
    1 -1
    1 1
    -1 1
    ];
b = [2 2 2 2];

minFrankWolfe(x, f, A, b, [-1 -1])
