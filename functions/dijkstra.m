% edges = [
%     1 2 3 7
%     1 3 5 7
%     2 3 4 5
%     2 4 4 12
%     2 6 5 4
%     3 4 4 5
%     3 5 10 7
%     3 6 5 10
%     4 6 3 11
%     5 6 7 9
%     ];

% edges = edges(:, [1 2 3]);
% root = 1;

% dijkstra(edges)

function dijkstra(edges, root)

    arguments
        edges (:, 3)
        root = 1
    end

    src = edges(:, 1);
    dst = edges(:, 2);
    cost = edges(:, 3);

    nodes = sort(unique([src dst]));
    predecessor = zeros(size(nodes));
    potential = Inf * ones(size(nodes));

    predecessor(root) = -1;
    potential(root) = 0;

    Q = [root];

    sequence_table = table(nodes);
    step = 0;

    while ~isempty(Q)
        step = step + 1;
        sequence_table.("pot"+string(step)) = potential;
        sequence_table.("pred"+string(step)) = predecessor;

        Q = sort(Q);
        [~, minIdx] = min(potential(Q));

        currentNode = Q(minIdx);
        Q(minIdx) = [];

        successors = unique(dst(src == currentNode));

        for j = successors'
            cost_ij = cost(src == currentNode & dst == j);

            if potential(j) > potential(currentNode) + cost_ij
                potential(j) = potential(currentNode) + cost_ij;
                predecessor(j) = currentNode;

                Q = unique([Q j]);
            end

        end

    end

    sequence_table.potential = potential;
    sequence_table.predecessor = predecessor;
    sequence_table

    shortest_path_tree_edges = [predecessor(2:end) nodes(2:end)]

end
