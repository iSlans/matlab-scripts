function cuts = gomory(c, A, b)
    % NEED Symbolic Matlab Toolbox
    % >> license("checkout", "symbolic_toolbox")
    %
    % Gomory cutting plane
    % c, A, b in dual form
    %   min c*x
    %   A*x = b
    %   x >= 0
    %
    % Example
    % c = [-5 -14];
    % A = [
    %     18 8 1 0
    %     14 18 0 1
    %     ];
    % b = [55 61];
    % cuts = gomory(c, A, b);

    arguments
        c (:, 1)
        A (:, :)
        b (:, 1)
    end

    % need e variables in objective for linprog
    if length(c) < size(A, 2)
        c(end + 1:size(A, 2)) = 0;
    end

    % ---------------------------------------------------------------------------- %
    %                             Find relaxed optimum                             %
    % ---------------------------------------------------------------------------- %

    ub = c * 0;
    x_relaxed = linprog(c, [], [], A, b, ub, []);

    log.info("Relaxed optimum solution: \n\t [ %s ] \n", join(string(x_relaxed), " "))

    % ---------------------------------------------------------------------------- %
    %                          Calculate fractional coeff                          %
    % ---------------------------------------------------------------------------- %

    fractional = @(x) frac(sym(x));
    baseIndex = fractional(x_relaxed) ~= 0;
    baseIndex = logical(baseIndex);

    ones_baseIndex = sum(baseIndex == 1);

    if ones_baseIndex == 0
        log.info("Already integer solution \n")
        return
    elseif ones_baseIndex < size(A, 1)
        log.info("Degenerate solution, using first index available \n")
        num_elem = size(A, 1) - ones_baseIndex;
        baseIndex(find(x_relaxed == 0, num_elem)) = true;
    end

    At = A(:, baseIndex) \ A(:, ~baseIndex);

    At = fractional(At);
    xbase = fractional(x_relaxed(baseIndex));

    % ---------------------------------------------------------------------------- %
    %                             Calculate Gomory cuts                            %
    % ---------------------------------------------------------------------------- %

    syms("x", [size(A, 2) - size(A, 1) 1])
    syms("e", [size(A, 1) 1])

    coeff = [x; e];

    cuts = (At * coeff(~baseIndex)) - xbase >= 0;

    log.info("\nGomory cuts, raws with slack variables e: \n\n%s \n", formattedDisplayText(cuts * -1))

    % ------------------------ substitute slack variables ------------------------ %
    equations = A * coeff == b;

    for i = 1:length(e)
        equations(i) = isolate(equations(i), e(i));
    end

    cuts = subs(cuts, lhs(equations), rhs(equations));
    cuts = simplify(cuts * -1);

    log.info("\nGomory cuts, simplified: \n\n%s \n", formattedDisplayText(cuts))

    if logging == "DEBUG"
        r = find(baseIndex);
        table(r, cuts)
        c, A, b, At, x_relaxed, xbase, equations
    end

end
