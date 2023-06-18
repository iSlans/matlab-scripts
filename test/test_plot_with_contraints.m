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

% ------------------------------------- 2 ------------------------------------ %

syms x [2 1]

f = 3 * x1 ^ 2 - x1 * x2 -x1 + 2 * x2;

points = [
    -1 0
    0 -2
    3 2
    4 -2
    0 2
    ];

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

% ------------------------------------- 3 ------------------------------------ %

syms x [2 1]
f = x1 ^ 2 + 2 * x2 ^ 2;
points = [
    -3 1
    0 3
    3 1
    2 -2
    -2 -2
    ];

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

% ------------------------------------- 4 ------------------------------------ %

syms x [2 1]
f = (x1 - x2) ^ 2;
points = [
    0 0
    0 2
    1 3
    2 3
    3 2
    3 0
    ];

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnPolygon(f, points);
% hold off

% ------------------------------------- 5 ------------------------------------ %
syms x [2 1]
f = x1 ^ 2 * x2 - 2 * x1 ^ 2 + x1 + x2;
points = [
    -2 -2
    0 2
    2 1
    2 -1
    ];

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

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% % plotSurfOnContraints(f -10, g)
% % plotSurfOnContraints(f -30, [g (-g - 1)])
% % plotSurfOnContraints(f + 15, [h - 10])
% % plotSurfOnContraints(f + 30, [(-h + 1), (h - 10)])
% r = plotSurfOnContraints(f, [], [fix(h - 10)])
% hold off

% ------------------------------------- 2 ------------------------------------ %

syms x [2 1]

f = x2 - x1 ^ 2;
h = x1 ^ 2 + x2 ^ 2 + 2 * x2;

% plotSurfOnContraints(f, [], round(h, 1));
% hold on
% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold off

% ------------------------------------- 3 ------------------------------------ %
syms x [2 1]

f = x2 - x1 ^ 2;
h = x1 ^ 2 + x2 ^ 2 + 2 * x2;

% plotSurfOnContraints(f, [], round(h, 1));
% hold on
% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold off

% ------------------------------------- 4 ------------------------------------ %
syms x [2 1]

f = x1 + x2;
g = x1 ^ 2 + x2 ^ 2 - 4;
g2 = -x1 ^ 2 - x2 ^ 2 + 1;

% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold on
% plotSurfOnContraints(f, [g g2]);
% hold off

% ------------------------------------- 5 ------------------------------------ %

syms x [2 1]

f = x1 ^ 2 + x2 ^ 2 - 4 * x1 -2 * x2;
g = x1 ^ 2 + 4 * x2 ^ 2 - 4 * x1 -8 * x2 + 4;
g2 = x1 - 2;

% plotSurfOnContraints(f, [g g2]);
% hold on
% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold off

% ------------------------------------- 6 ------------------------------------ %
syms x [2 1]
f = x1 - x2 ^ 2;
h = 4 * x1 ^ 2 + x2 ^ 2 - 4;

% plotSurfOnContraints(f, [], fix(h));
% hold on
% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold off

% ------------------------------------- 7 ------------------------------------ %
syms x [2 1]
f = x1 ^ 4 + x2 ^ 4;
h = x1 ^ 2 + x2 ^ 2 - 1;

% plotSurfOnContraints(f, [], floor(h));
% plotSurfOnContraints(f, h);
% hold on
% fmesh(f, "FaceAlpha", 0, "MeshDensity", 20)
% hold off
