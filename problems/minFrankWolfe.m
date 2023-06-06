% syms x [2 1]
% f = x1 ^ 2 + x2 ^ 2 -16 * x1 -12 * x2;
% A = [
%     -2 3
%     2 3
%     1 0
%     -1 0
%     0 -1
%     ];
% b = [12 24 6 0 0]';
% xk = [6 1]';

% f = -2 * x1 ^ 2 - 2 * x1 * x2 -4 * x2 ^ 2 - 9 * x2;
% f = -f;
% A = [
%     1 -1
%     1 2
%     -1 -3
%     -2 1
%     ];
% b = [2 11 -2 3]';
% xk = [0 2/3]';

function minFrankWolfe(x, f, A, b, xk)

    % min f
    % Ax <= b

    arguments
        x (:, 1)
        f (1, 1)
        A (:, :)
        b (:, 1)
        xk (:, 1)
    end

    log.warning("Frank Wolfe for min objective! \n")

    grad_f = gradient(f, x);
    grad_f_xk = subs(grad_f, x, xk)

    linearized_objective = transpose(x) * grad_f_xk

    yk = linprog(double(grad_f_xk), A, b)

    syms t

    direction_f = simplify(subs(f, x, xk + t * (yk -xk)))
    handlef = matlabFunction(direction_f);

    candidate_t = fminbnd(handlef, 0, 1);
    candidates = [0 candidate_t 1];
    [~, min_idx] = min(arrayfun(handlef, candidates));
    tk = candidates(min_idx)

    dk = yk - xk
    new_xk = xk + tk * dk

end
