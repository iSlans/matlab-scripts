f = @(x, y) 2 * x * y + 4 * x - 6 * y

% f = @(x, y) x ^ 2 + y ^ 2

g = @(x, y) x ^ 2 + y ^ 2

xyinterval = [-4 4 -3 5]

% fsurf(f, xyinterval)
% hold on
fsurf(g)
% fsurf(@comb)
% pbaspect([1 1 5])
