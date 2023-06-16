function [x, fval] = relaxedSymmetricTSP(table, lb, ub)
    % ASSIGNMENT
    %   helper function for symmetric TSP inadmissibility check in branch&bound
    %   table: assignment cost table, upper triangular
    %   lb: lowerbound
    %   ub: upperbound
    % - use lb and ub to fix a variable value
    %
    % note: lb, ub refer to table variables in column wise order

    arguments
        table (:, :) {mustBeNumeric, mustBeSquareMatrix}
        lb (:, 1) = []
        ub (:, 1) = []
    end

    if ~isequal(table, triu(table)) && ~isequal(table, table')
        log.warning("\nWarning: Input table is not a upper triangular, considering only the upper value... \n ")
    end

    table = triu(table);

    % --------------------------------- Get sizes -------------------------------- %

    length = size(table, 1);
    num_vars = length ^ 2;

    % --------------------------- Build linprog inputs --------------------------- %

    c = reshape(table, [], 1);

    grade_contraint = [];

    for i = 1:length
        tab = zeros(length);
        tab(i, i + 1:end) = 1;
        tab(1:i - 1, i) = 1;

        % tab = tab';

        grade_contraint = [
            grade_contraint
            tab(:)'
            ];
    end

    Aeq = grade_contraint;
    beq = ones(length, 1) * 2;

    if isempty(lb)
        lb = zeros(num_vars, 1);
    end

    if isempty(ub)
        ub = ones(num_vars, 1);
    end

    [x, fval] = linprog(c, [], [], Aeq, beq, lb, ub);

    % -------------------------------- Print Data -------------------------------- %

    log.info('Solving Assignment problem (column wise variables order): \n \n')

    log.info('c = \t %s \n', str(c));

    F = ['\t', repmat(' %d', 1, size(Aeq, 2)), '\n'];
    log.info('Aeq = [\n')
    log.info(F, Aeq')
    log.info(']\n')

    log.info('beq = \t %s \n', str(beq));
    log.info('lb = \t %s \n', str(lb));
    log.info('ub = \t %s \n', str(ub'));

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
