function p = plotSurfOnPolygon(f, points)

    arguments
        f
        points (:, 2)
    end

    mf = matlabFunction(f);

    toOneOrNan = @(x) x ./ x;
    inpoly = @(x, y) inpolygon(x, y, points(:, 1), points(:, 2));

    f = @(x, y) mf(x, y) .* toOneOrNan(inpoly(x, y));
    p = fsurf(f);

end
