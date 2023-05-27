function [sol, sol_dual] = baseSolutionProblem(c, A, b, baseIndex, opt)
    % BASESOLUTION
    %   find with base indexes
    %       - primal base solution x
    %       - dual base solution y

    arguments
        c (:, 1) {mustBeNumeric}
        A (:, :) {mustBeNumeric}
        b (:, 1) {mustBeNumeric}
        baseIndex (:, 1) {mustBeNumeric} = 1:length(b)

        opt.form string {mustBeMember(opt.form, ["primal", "dual"])} = "primal"
        opt.objective string {mustBeMember(opt.objective, ["min", "max"])} = "max"
        opt.display logical = false

    end

    if (opt.form == "primal")

        sol = baseSolution(A, b, baseIndex);
        isAdmissible(A, sol, b);
        isDegenerate(A, sol, b, baseIndex);

        A_dual = A(baseIndex, :)';
        b_dual = c;

        sol_dual = zeros(length(b), 1);
        sol_dual(baseIndex) = baseSolution(A_dual, b_dual);

        fprintf("x = [ %s ] \n", toRationalString(sol))
        fprintf("y = [ %s ] \n", toRationalString(sol_dual))

        sol = sol';
        sol_dual = sol_dual';

    end

    if (opt.form == "dual")
        disp("...")
    end

    % ----------------------------------- print ---------------------------------- %

    % if (opt.display == true)

    %     vars = optimvar("x", size(c));
    %     objFun = dot(vars, c);
    %     constraints = A * vars <= b;

    %     problem = optimproblem;
    %     problem.ObjectiveSense = opt.objective;
    %     problem.Objective = objFun;
    %     problem.Constraints = constraints;

    %     format compact
    %     show(problem)
    %     % solve(problem)
    % end

    % ------------------------------------- - ------------------------------------ %
end

% utils function
function str = toRationalString(o)

    arguments
        o (1, :)
    end

    str = strtrim(rats(o));
    str = regexprep(str, ' +', ' ');
end
