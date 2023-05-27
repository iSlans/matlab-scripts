function [bool] = isDegenerate(A, x, b, baseIndex)

    arguments

        A (:, :)
        x (:, 1)
        b (:, 1)
        baseIndex (1, :)

    end

    bool = A * x == b;
    bool(baseIndex) = 0; % exclude base indexes
    bool = any(bool == 1);

    % bool = A * x == b;
    % bool = nnz(bool) > size(A, 2);

end
