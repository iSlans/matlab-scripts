function [path, cost] = nearestNode(table, root)

    arguments
        table (:, :) %{MustBeSquareMatrix}
        root {mustBeNonnegative}
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
