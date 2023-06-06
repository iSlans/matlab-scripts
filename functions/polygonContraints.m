points = [
    4 2
    -3 -2
    0 -3
    -4 5
    ];

% RicOp.vert2con(points)
% return

order = convhull(points);
points = points(order, :);

syms x [2 1]
x = x1;
y = x2;

eqs = [];

for i = 1:length(points) - 1
    a = points(i, :);
    b = points(i + 1, :);

    coeff = [a(1) 1; b(1) 1] \ [a(2); b(2)];

    eq = simplify(- coeff(1) * x + y == coeff(2));
    eqs = [eqs; eq];
end

eqs
