% function x = base(A, b, baseIndex)
function x = baseSolution(A, b, baseIndex)
    % BASESOLUTION solve AX = b with base indexes

    arguments
        A (:, :) {mustBeNumeric}
        b (:, 1) {mustBeNumeric}
        baseIndex (:, 1) {mustBeNumeric, dimensionsCheck(A, b, baseIndex)} = 1:length(b)
    end

    Abase = A(baseIndex, :);
    bbase = b(baseIndex);

    x = linsolve(Abase, bbase);

end

% Custom validation function
function dimensionsCheck(A, b, indexes)

    [n, m] = size(A);

    if (n ~= length(b))
        eid = 'Size:notEqual';
        msg = 'Size of b must equal of size1 matrix A: %d, got %d.';
        msg = sprintf(msg, n, length(b));
        throwAsCaller(MException(eid, msg))

    elseif (m ~= length(indexes))
        eid = 'Size:notEqual';
        msg = 'Size of indexes must equal of size2 matrix A: %d, got %d.';
        msg = sprintf(msg, m, length(indexes));
        throwAsCaller(MException(eid, msg))
    end

end
