% myaddpath(pwd)
% addpath('./problems')
% addpath('./utils')

% format compact

% Hamilton
A = [
    1000 33 39 35 60
    33 1000 33 29 54
    13 46 1000 12 30
    25 58 12 1000 23
    33 76 30 23 1000
    ];
x = assignment(A);

A = [
    0 24 21 20 9
    0 0 23 40 13
    0 0 0 30 25
    0 0 0 0 28
    0 0 0 0 0
    ];
A = A + A' + eye(5) * 1000
