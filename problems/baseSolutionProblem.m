function [x_sol, y_sol] = baseSolutionProblem(c, A, b, baseIndex)
    % BASESOLUTION
    % given c, A, b in primal form notation
    % find with base indices:
    %       - primal base solution x
    %       - dual base solution y

    arguments
        c (:, 1) {mustBeNumeric}
        A (:, :) {mustBeNumeric}
        b (:, 1) {mustBeNumeric}
        baseIndex (:, 1) {mustBeNumeric} = 1:length(b)

    end

    % log.info("BaseSolution: solving for primal form \n")

    x_sol = baseSolution(A, b, baseIndex);

    A_dual = A(baseIndex, :)';
    b_dual = c;

    y_sol = zeros(length(b), 1);
    y_sol(baseIndex) = baseSolution(A_dual, b_dual);

    log.info("x = [ %s ] \n", toRationalString(x_sol))
    log.info("y = [ %s ] \n", toRationalString(y_sol))

    % x_sol = x_sol';
    % y_sol = y_sol';

end

% utils function
function str = toRationalString(o)

    arguments
        o (1, :)
    end

    str = strtrim(rats(o));
    str = regexprep(str, ' +', ' ');
end
