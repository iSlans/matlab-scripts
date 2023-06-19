function [restricted, plotSurf] = plotSurfOnContraints(f, g, h, opt)
    % Plot function f on contraints g, h
    %   f
    %   g <= 0
    %   h == 0
    %
    % - fmesh: boolean parameter    use it to plot also f unconstrained

    % Example
    % syms x1 x2
    % f = x2 - x1 ^ 2 + x1 * x2;
    % g =- x1 ^ 2 - (x2 - 1) ^ 2 + 1;
    % plotSurfOnContraints(f, g)
    % plotSurfOnContraints(f, g, fmesh=true)
    %
    % it does not work well with h == 0 constraints as it is only a curve line,
    % you can pass for example 'fix(h)' as parameter to make it as a region.
    % if you have only 1 h function, you could use it as g, and consider only the border of region
    %   EX.
    %       h = x1 ^ 2 + x2 ^ 2 - 16;
    %       plotSurfOnContraints(f, [], fix(h))
    %       plotSurfOnContraints(f, h)

    arguments
        f (1, :)
        g (1, :) = sym(0)
        h (1, :) = sym(0)
        opt.fmesh logical = false
    end

    if isempty(g)
        g = sym(0);
    end

    if isempty(h)
        h = sym(0);
    end

    checkG = 1;
    checkH = 1;

    for i = 1:length(g)
        checkG = checkG & (g(i) <= 0);
    end

    for i = 1:length(h)
        checkH = checkH & (h(i) == 0);
    end

    x = getVars([f, g, h]);
    mf = matlabFunction(f, vars = x);
    checkG = matlabFunction(checkG, vars = x);
    checkH = matlabFunction(checkH, vars = x);

    zeroToNan = @(x) x ./ x;
    constraints = @(x, y) zeroToNan(checkG(x, y)) .* zeroToNan(checkH(x, y));
    restricted = @(x, y) mf(x, y) .* constraints(x, y);

    if opt.fmesh
        larger = @(lim) lim + [-1 1] * abs(diff(lim)) / 8;
        plotSurf = fsurf(restricted, "DisplayName", "restricted");
        newxlim = larger(xlim);
        newylim = larger(ylim);
        xlim(newxlim)
        ylim(newylim)
        hold on
        fmesh(f, "FaceAlpha", 0)
        hold off
        ax = gca;
        ax.Children = ax.Children([2 1]);
    else
        plotSurf = fsurf(restricted, "DisplayName", "restricted");
    end

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
