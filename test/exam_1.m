format compact
format rational
% format short

logging all
% logging debug

%%
% ---------------------------------- simplex --------------------------------- %
c = [30 30 35 35];
A = [
    5 0 7 0
    0 5 0 7
    1 1 0 0
    0 0 1 1
    -1 0 0 0
    0 -1 0 0
    0 0 -1 0
    0 0 0 -1
    ];
b = [119 91 23 15 0 0 0 0];

initial_x = [23 0 0 13];
baseIndex = find(A * initial_x' == b');
% baseIndex

% primalSimplex(c, A, b, [2 3 6 7])
% primalSimplex(c, A, b, baseIndex, depthLimit = 2

%%
% ---------------------------------- gomory ---------------------------------- %

% c =- [30 30 35 35 0 0 0 0];
% A = [
%     5 0 7 0 1 0 0 0
%     0 5 0 7 0 1 0 0
%     1 1 0 0 0 0 1 0
%     0 0 1 1 0 0 0 1
%     ];
% b = [119 91 23 15];

% gomory(c, A, b);

% c = [30 30 35 35];
% A = [
%     5 0 7 0
%     0 5 0 7
%     1 1 0 0
%     0 0 1 1
%     0 4 0 5
%     ];
% b = [119 91 23 15 72];
% lb = [0 0 0 0];
% ub = [];
% linprog(-c, A, b, [], [], lb, ub)

%%
% ---------------------------- optimal intlinprog ---------------------------- %

% c = [30 30 35 35];
% A = [
%     5 0 7 0
%     0 5 0 7
%     1 1 0 0
%     0 0 1 1
%     ];
% b = [119 91 23 15];
% ints = [1 2 3 4]
% lb = [0 0 0 0];
% ub = [];

% intlinprog(-c, ints, A, b, [], [], lb, ub)
