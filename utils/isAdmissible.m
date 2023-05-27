function [bool] = isAdmissible(A, x, b)

    arguments

        A (:, :)
        x (:, 1)
        b (:, 1)
    end

    bool = A * x <= b;
    bool = any(bool ~= 1);
end
