function p = plotSurfOnPolygon(f, points, grid_interval)

    arguments
        f
        points (:, 2)
        grid_interval = 0.01;
    end

    f = matlabFunction(f);

    % xlim([min(points(:, 1)) max(points(:, 1))])
    % ylim([min(points(:, 2)) max(points(:, 2))])

    x = min(points(:, 1)):grid_interval:max(points(:, 1));
    y = min(points(:, 2)):grid_interval:max(points(:, 2));

    [x, y] = meshgrid(x, y);

    isInternal = inpolygon(x, y, points(:, 1), points(:, 2));
    mask = reshape(isInternal, size(x));

    z = f(x, y);
    z(~mask) = nan;

    % p = surface(x, y, z, "EdgeColor", "none");
    p = surf(x, y, z, "EdgeColor", "none");

end
