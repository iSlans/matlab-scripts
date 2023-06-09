% A = [1 2 3; 4 5 6; 7 8 9]
% c = [47, 14, 42, 21, 36, 18, 43, 28, 39, 29, 38, 36, 31, 22, 28, 39];
% A = reshape(c, 4, 4)';
% assignment(A) % not local function for script file

function [x, fval] = assignment(table, lb, ub)
    % ASSIGNMENT
    %   solve the min cost assignment problem
    %   table: assignment cost table

    arguments
        table (:, :) {mustBeNumeric, mustBeSquareMatrix}
        lb (:, 1) = []
        ub (:, 1) = []
    end

    % --------------------------------- Get sizes -------------------------------- %

    length = size(table, 1);
    num_vars = length ^ 2;

    % --------------------------- Build linprog inputs --------------------------- %

    c = reshape(table, [], 1);

    cols_contraint = repmat(diag(ones(length, 1)), 1, length);
    rows_contraint = zeros(length, num_vars);

    for row = 1:length
        start_idx = 1 + (row - 1) * length;
        end_idx = row * length;
        rows_contraint(row, start_idx:end_idx) = 1;
    end

    Aeq = [rows_contraint; cols_contraint];
    beq = ones(length * 2, 1);

    if isempty(lb)
        lb = zeros(num_vars, 1);
    end

    if isempty(ub)
        ub = ones(num_vars, 1);
    end

    [x, fval] = linprog(c, [], [], Aeq, beq, lb, ub);

    % -------------------------------- Print Data -------------------------------- %

    log.info('Solving Assignment problem: \n \n')

    log.info('c = \t %s \n', str(c));

    F = ['\t', repmat(' %d', 1, size(Aeq, 2)), '\n'];
    log.info('Aeq = [\n')
    log.info(F, Aeq')
    log.info(']\n')

    log.info('beq = \t %s \n', str(beq));
    log.info('lb = \t %s \n', str(lb));
    log.info('ub = \t %s \n', str(ub));

    log.info('\n')
    log.info('linprog(c, [], [], Aeq, beq, lb, ub)\n');

    if isempty(x)
        log.warning("Assignment no solution found\n")
        return
    end

    log.info('x = \t %s \n', str(x));
    log.info('fval = \t %d \n', fval);
    squared = reshape(x, size(table));
    txt = formattedDisplayText(squared, "NumericFormat", "short");
    log.info("formatted x = \n%s \n", txt)

end

function mustBeSquareMatrix(matrix)
    n = size(matrix);

    if n(1) ~= n(2)
        eid = 'Size:notEqual';
        msg = 'Must be a square matrix.';
        throwAsCaller(MException(eid, msg))
    end

end

function str = str(o)

    arguments
        o (1, :)
    end

    str = join(string(o), ' ');
    str = sprintf("[ %s ]", str);

end
