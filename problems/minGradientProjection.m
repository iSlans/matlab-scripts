% syms x [2 1]

% f = 2 * x1 * x2 + 4 * x1 -6 * x2;
% f = -f;
% A = [
%     -1 -3
%     5 -4
%     3 8
%     -7 -1
%     ];
% b = [9 12 28 23]';

% xk = [-1 -8/3]';
% minGradientProjection(x, f, A, b, xk)

function minGradientProjection(x, f, A, b, xk)
    % objective min f

    arguments
        x
        f (1, 1)
        A (:, :)
        b (:, 1)
        xk (:, 1)
    end

    grad_f = gradient(f, x);
    grad_f_xk = subs(grad_f, x, xk)

    V = A(A * xk == b, :)
    H = eye(length(V)) - V' * (V * V') ^ -1 * V
    dk =- H * subs(grad_f, x, xk)

    if any(dk ~= 0)
        dk = double(dk);
        maxt = linprog(-1, A * dk, b - A * xk);

        syms t

        direction_f = simplify(subs(f, x, xk + t * dk));
        handlef = matlabFunction(direction_f);

        % tk = fmincon(handlef, maxt, [], [], [], [], 0, maxt)

        candidate_t = fminbnd(handlef, 0, maxt);
        candidates = [0 candidate_t maxt];
        [~, min_idx] = min(arrayfun(handlef, candidates));

        tk = candidates(min_idx)

        new_xk = xk + tk * dk

    end

    if all(dk == 0)

        disp("Not implemented")

        lambda =- (V * V') ^ -1 * V * subs(grad_f, x, xk);

        if lambda >= 0
            % break
        else
            active_constraints_idx = A * xk == b;
            % ...
        end

    end

end
