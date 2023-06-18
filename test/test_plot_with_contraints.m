% ---------------------------------------------------------------------------- %
%                                  on polygon                                  %
% ---------------------------------------------------------------------------- %

syms x [2 1]

f = -2 * x1 ^ 2 -6 * x1 * x2 -10 * x1 - 3 * x2;

points = [
    -2 2
    4 2
    4 0
    0 -3
    ];

% fsurf(f)

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

% ---------------------------------------------------------------------------- %
%                              on g, h contraints                              %
% ---------------------------------------------------------------------------- %

syms x [2 1]

f = x2 - x1 ^ 2 + x1 * x2;
g =- x1 ^ 2 - (x2 - 1) ^ 2 + 1;
h = x1 ^ 2 + x2 ^ 2;

fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
hold on
% plotSurfOnContraints(f -10, g)
% plotSurfOnContraints(f -30, [g (-g - 1)])
% plotSurfOnContraints(f + 15, [h - 10])
% plotSurfOnContraints(f + 30, [(-h + 1), (h - 10)])
r = plotSurfOnContraints(f, [], [fix(h - 10)])
hold off
