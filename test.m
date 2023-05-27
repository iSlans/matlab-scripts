% myaddpath(pwd)
addpath('./problems')
addpath('./utils')

format compact

% A = [1 2 3; 4 5 6; 7 8 9];
c = [47, 14, 42, 21, 36, 18, 43, 28, 39, 29, 38, 36, 31, 22, 28, 39];
A = reshape(c, 4, 4)';
[x, fv] = assignment(A, displayData = 1);

% [f, A, b] = dualFromPrimal([1 2], A, [1 2])

% A([1, 2], :)

A = [
     0 1
     -1 0
     1 0
     1 -1
     -3 -2
     0 -1
     ]
b = [3 2 2 3 6 5]
c = [5 -6]
baseSolution(A([2 5], :)', c)
% /home/sandro/Scrivania/Ricerca Operativa/scripts:/home/sandro/Scrivania/Ricerca Operativa/scripts/problems:/home/sandro/Scrivania/Ricerca Operativa/scripts/utils:/home/sandro/Scrivania/Ricerca Operativa/scripts/.vscode
