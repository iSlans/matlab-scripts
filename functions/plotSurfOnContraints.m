function [restricted, plotSurf] = plotSurfOnContraints(f, g, h)
    % Plot function f on contraints g, h
    %  f
    %  g <= 0
    %  h == 0
    %
    % it does not work well with h == 0 constraints as it is only a curve line,
    % you can pass for example 'fix(h)' as parameter to make it as a region
    %
    % EX.
    % h = x1 ^ 2 + x2 ^ 2 - 16;
    % plotSurfOnContraints(f, [], fix(h))

    arguments
        f (1, :)
        g (1, :) = sym(0)
        h (1, :) = sym(0)
    end

    g = unique(g);
    h = unique(h);

    if isempty(g)
        g = sym(0);
    end

    x = getVars([f, g, h]);

    checkG = 1;
    checkH = 1;

    for i = 1:length(g)
        checkG = checkG & (g(i) <= 0);
    end

    for i = 1:length(h)
        checkH = checkH & (h(i) == 0);
    end

    mf = matlabFunction(f, vars = x);
    checkG = matlabFunction(checkG, vars = x);
    checkH = matlabFunction(checkH, vars = x);

    zeroToNan = @(x) x ./ x;
    constraints = @(x, y) zeroToNan(checkG(x, y)) .* zeroToNan(checkH(x, y));
    restricted = @(x, y) mf(x, y) .* constraints(x, y);

    plotSurf = fsurf(restricted, "DisplayName", "restricted");

end

function x = getVars(functions)

    vars = arrayfun(@getvar, functions, "UniformOutput", false);
    x = sort(unique([vars{:}]));

    function var = getvar(f)

        if isa(f, "sym")
            var = symvar(f);
        else
            var = [];
        end

    end

end
