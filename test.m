addpath(genpath("scripts"))

% A = [1 2 3; 4 5 6; 7 8 9];
c = [47, 14, 42, 21, 36, 18, 43, 28, 39, 29, 38, 36, 31, 22, 28, 39];
A = reshape(c, 4, 4)';
[x, fv] = assignment(A);
