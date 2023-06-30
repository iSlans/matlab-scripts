format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

syms x [2 1]

f = 2 * x1 * x2 + 4 * x1 + x2;
minf = f;

points = [
    1 0
    -5 -1
    -5 -3
    -1 -3
    ];

polygonContraints(points);

%%

A = [
    -1 6
    -1 0
    0 -1
    3 -2
    ];
b = [-1 5 3 3]';

xk = [-11/3 -3]';

minFrankWolfe(x, minf, A, b, xk)
minGradientProjection(x, minf, A, b, xk)

% RicOp.FrankWolfe(minf, A, b, xk, 2)
% RicOp.gradienteProiettato(minf, A, b, xk, 2)

%%
% ----------------------------------- lkkt ----------------------------------- %

g = A * x - b;

%%

sympref('FloatingPointOutput', true)
% sympref('FloatingPointOutput', false)

symrat(0)
symrat

LKKTsystem(x, minf, g)

RicOp.LKKT(minf, g)

%%
% ----------------------------------- plot ----------------------------------- %

% fsurf(f)

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

plotSurfOnContraints(f, g, fmesh = true)
