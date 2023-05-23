% A = [1 2 3; 4 5 6; 7 8 9]
% c = [47, 14, 42, 21, 36, 18, 43, 28, 39, 29, 38, 36, 31, 22, 28, 39];
% A = reshape(c, 4, 4)';
% assignment(A) % not local function for script file

function [x, fval] = assignment(table, options)
    % ASSIGNMENT table: problem's assignment cost table

    arguments
        table (:, :) {mustBeNumeric, mustBeSquareMatrix}
        options.displayData logical {mustBeNumericOrLogical} = true
    end

    % --------------------------------- Get sizes -------------------------------- %

    length = size(table, 1);
    num_vars = length ^ 2;

    % --------------------------- Build linprog inputs --------------------------- %

    c = reshape(table', [], 1);

    cols_contraint = repmat(diag(ones(length, 1)), 1, length);
    rows_contraint = zeros(length, num_vars);

    for row = 1:length
        start_idx = 1 + (row - 1) * length;
        end_idx = row * length;
        rows_contraint(row, start_idx:end_idx) = 1;
    end

    Aeq = [rows_contraint; cols_contraint];
    beq = ones(length * 2, 1);
    lb = zeros(num_vars, 1);
    % ub = ones(num_vars, 1);

    [x, fval] = linprog(c, [], [], Aeq, beq, lb, []);

    % -------------------------------- Print Data -------------------------------- %

    if (options.displayData == true)

        fprintf('Solving Assignment problem: \n \n')

        fprintf('c: \t[%s]\n', join(string(c'), ' '));

        F = ['\t', repmat(' %d', 1, size(Aeq, 2)), '\n'];
        fprintf('Aeq: [\n')
        fprintf(F, Aeq')
        fprintf(']\n')

        fprintf('beq: \t[%s]\n', join(string(beq'), ' '));
        fprintf('lb: \t[%s]\n', join(string(lb'), ' '));
        % fprintf('ub: \t[%s]\n', join(string(ub'), ' '));

        fprintf('\n')
        fprintf('linprog(c, [], [], Aeq, beq, lb, [])\n');
        fprintf('x: \t[%s]\n', join(string(x'), ' '));
        fprintf('fval: \t%d \n', fval);

    end

end

function mustBeSquareMatrix(matrix)
    n = size(matrix);

    if n(1) ~= n(2)
        eid = 'Size:notEqual';
        msg = 'Must be a square matrix.';
        throwAsCaller(MException(eid, msg))
    end

end
