sympref('FloatingPointOutput', true)
% sympref('FloatingPointOutput', false)

% ------------------------------------ -- ------------------------------------ %

syms x [2 1]
f = x1 + x2;
g = [x1 ^ 2 + x2 ^ 2 - 2];
h = [x1 ^ 2 - x2];

% sol = LKKTsystem(x, f, g, h);

% ------------------------------------ --- ----------------------------------- %

syms x [2 1]
f = x1 ^ 2 + 2 * x1 + x2 ^ 2 + 2 * x2;
g = [
    x1 + x2 ^ 2
    x1 ^ 2 - 4
    ];
h = [];
% sol = LKKTsystem(x, f, g);

% ------------------------------------- - ------------------------------------ %

syms x [2 1]
f = -x1 ^ 2 + x2;
g = [];
h = [
    x1 ^ 2 + x2 ^ 2 + 2 * x2
    ];
% sol = LKKTsystem(x, f, g, h);

% s.value(:,1) = subs(f, vars, s.x)

% a = linspace(0, 20, 21);
% b = a';
% c = -a .^ 2 + b;
% surf(a, b, c)

% fsurf(@(x, y) -x ^ 2 + y)
% fimplicit3()

syms x [2 1]

f = 2 * x1 * x2 + 4 * x1 -6 * x2;
% f = -f;
A = [
    -1 -3
    5 -4
    3 8
    -7 -1
    ];
b = [9 12 28 23]';

g = A * x - b;
% sol = LKKTsystem(x, f, g);

% RicOp.LKKT(f, g)

% ---------------- ------------------------------------------- --------------- %
%%

sympref('FloatingPointOutput', true)
% sympref('FloatingPointOutput', false)

syms x [2 1]
f = x1 + x2;
g = [
    x1 ^ 2 + x2 ^ 2 - 4
    1 - x1 ^ 2 - x2 ^ 2
    ];

% s = LKKTsystem(x, f, g);

syms x [2 1]
f = x1 + x2;
g = [
    x1 ^ 2 + x2 ^ 2 - 4
    1 - x1 ^ 2 - x2 ^ 2
    ];

s = LKKTsystem(x, f, g);

%%
syms x [2 1]
f = x1 * x2;
g = [
    x1 ^ 2 + x2 ^ 2 - 8
    ];

LKKTsystem(x, f, g);

%%

syms x [2 1]
f = x1 ^ 2 + x2 ^ 2 - 4 * x1 - 2 * x2;
g = [
    x1 ^ 2 + 4 * x2 ^ 2 - 4 * x1 - 8 * x2 + 4
    x1 - 2
    ];

LKKTsystem(x, f, g);

%%

sympref('FloatingPointOutput', true)
% sympref('FloatingPointOutput', false)

syms x [2 1]
f = x1 - x2 ^ 2;
h = [
    4 * x1 ^ 2 + x2 ^ 2 - 4
    ];

LKKTsystem(x, f, [], h);

%%

syms x [2 1]
f = x1 ^ 4 + x2 ^ 4;
h = [
    x1 ^ 2 + x2 ^ 2 - 1
    ];

LKKTsystem(x, f, [], h);

%%

syms x [2 1]
f = x1 ^ 2 - x1 * x2;
g = [
    x1 + x2 - 1
    -x1
    -x2
    ];

% LKKTsystem(x, f, g);
