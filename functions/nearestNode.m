function [path, cost] = nearestNode(table, root, opt)
    % heuristic algorithm
    % upper bound evaluation for TSP problem
    % return a admissible Hamilton cycle and the cost
    %

    arguments
        table (:, :) %{MustBeSquareMatrix}
        root {mustBeNonnegative}
        opt.isSymmetric = false
    end

    % check and warn if table is triangular

    if opt.isSymmetric
        table = table + table' + eye(size(table, 1)) * 1e+10 * max(table(:));
    end

    len = length(table);

    indexFlags = ones(1, len);
    cyclePath = zeros(len, 1);

    indexFlags(root) = 0;
    cyclePath(1) = root;
    cost = 0;

    currentNode = root;

    for i = 2:len

        minValue = min(table(currentNode, indexFlags == 1));
        nextNode = find(table(currentNode, :) == minValue, 1);

        cost = cost + minValue;
        currentNode = nextNode;
        indexFlags(nextNode) = 0;
        cyclePath(i) = currentNode;
    end

    cost = cost + table(cyclePath(end), root);
    path = [cyclePath; root];
end
