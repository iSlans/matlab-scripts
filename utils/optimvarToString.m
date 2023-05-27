function str = optimvarToString(optimvar)
    % optimvarToString
    %   return variables names as string array
    %   as alternative to show(x)

    arguments
        optimvar {mustBeA(optimvar, 'optim.problemdef.OptimizationVariable')}
    end

    [n, m] = size(optimvar);
    varName = optimvar.Name;
    str = cell(n, m);

    if (m == 1)

        for i = 1:n
            t = sprintf("%s(%d)", varName, i);
            str(i) = cellstr(t);
        end

    else

        for i = 1:n

            for j = 1:m
                t = sprintf("%s(%d,%d)", varName, i, j);
                str(i, j) = cellstr(t);
            end

        end

    end

    str = string(str);

end
