function [f, A, b] = dualFromPrimal(p_f, p_A, p_b)

    arguments
        p_f (:, 1) {mustBeNumeric}
        p_A (:, :) {mustBeNumeric}
        p_b (:, 1) {mustBeNumeric}
    end

    f = p_b;
    A = p_A';
    b = p_f;

end
