function p = plotSurfOnPolygon(f, points)

    % Example
    % syms x [2 1]
    % f = -2 * x1 ^ 2 -6 * x1 * x2 -10 * x1 - 3 * x2;
    % vertices = [
    %     -2 2
    %     4 2
    %     4 0
    %     0 -3
    % ];
    % plotSurfOnPolygon(f, vertices);

    arguments
        f
        points (:, 2)
    end

    order = convhull(points);
    points = points(order, :);

    mf = matlabFunction(f);

    zeroToNan = @(x) x ./ x;
    isInPolygon = @(x, y) inpolygon(x, y, points(:, 1), points(:, 2));

    f = @(x, y) mf(x, y) .* zeroToNan(isInPolygon(x, y));
    p = fsurf(f);

end
