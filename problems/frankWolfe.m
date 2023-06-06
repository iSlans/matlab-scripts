syms x [2 1]
f = x1 ^ 2 + x2 ^ 2 -16 * x1 -12 * x2;
A = [
    -2 3
    2 3
    1 0
    -1 0
    0 -1
    ];
b = [12 24 6 0 0]';
xk = [6 1]';

% min f
% Ax <= b

% function frankWolfe(x,f,A,b, xk)

grad_f = gradient(f, x);
grad_f_xk = subs(grad_f, x, xk);

yk = linprog(double(grad_f_xk), A, b);

syms t

direction_f = simplify(subs(f, x, xk + t * (yk -xk)));
handlef = matlabFunction(direction_f);

candidate_t = fminbnd(handlef, 0, 1);
candidates = [0 candidate_t 1];
[~, min_idx] = min(arrayfun(handlef, candidates));
tk = candidates(min_idx)

dk = yk - xk
xk + tk * dk

% end
