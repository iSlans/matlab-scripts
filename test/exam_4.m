format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

syms x [2 1]

f = -2 * x1 ^ 2 -6 * x1 * x2 -10 * x1 - 3 * x2;
minf = f;

points = [
    -2 2
    4 2
    4 0
    0 -3
    ];

% polygonContraints(points);

A = [
    -5 -2
    3 -4
    1 0
    0 1
    ];
b = [6 12 4 2]';

xk = [1 2]';

% minFrankWolfe(x, minf, A, b, xk)
% minGradientProjection(x, minf, A, b, xk)

%%
% ----------------------------------- lkkt ----------------------------------- %

g = A * x - b;

sympref('FloatingPointOutput', true)
% sympref('FloatingPointOutput', false)

% LKKTsystem(x, minf, g)

%%
% ----------------------------------- plot ----------------------------------- %

% fsurf(f)

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

% plotSurfOnContraints(f, g, fmesh=true)
