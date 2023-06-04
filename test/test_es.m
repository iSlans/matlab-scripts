%

% min x1 + x2
% 100*x1 + 200*x2 >= 5000
% 500*x1 + 300*x2 >= 12000
% x >= 0

% min x1 + x2
% 100*x1 + 200*x2 -e1    = 5000
% 500*x1 + 300*x2    -e2 = 12000
% x, e >= 0

c = [-1 -1]
A =- [
    1 2
    5 3
    1 0
    0 1
    ]
b =- [50 120 0 0]

primalSimplex(c, A, b, [1 4])

% return

c = [1 1 0 0];
b = [50 120];
A = [
    1 2 -1 0
    5 3 0 -1
    ];
% [y, x] = dualSimplex(b, A, c, [1 4])
gomory(c, A, b);

% Dual Simplex step 1
%              key                value
%     ___________________    ______________
%      base                   1 4
%      x                      1/100 0
%      y                      50 0 0 13000
%      f function value       50
%      h exiting index        4
%      k entering index       2
%      r ratios               25 130/7
%      new base               1 2
%
% Dual Simplex step 2
% optimum found
% y =
%           50
%            0
%            0
%        13000
% x =
%        90/7
%       130/7
%         0
%         0

% Gomory Cuts
% 1) x1 <= 12
% 2) x2 <= 18
