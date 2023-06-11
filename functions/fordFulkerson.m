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

% edges = edges(:, [1 2 4]);
% root = 1;
% destination = 6;
% fordFulkerson(edges, root, destination)

function fordFulkerson(edges, root, destination)

    x = zeros(length(edges), 1);

    while true

        residual_edges = residualGraph(edges, x)

        [path_edges, maxflow, ns, nt] = augmentingPath(residual_edges, root, destination);

        if isnan(path_edges)
            ns, nt
            break
        else
            path_edge_idx = ismember(edges(:, [1 2]), path_edges, "rows");
            x(path_edge_idx) = x(path_edge_idx) + maxflow;

            path_edge_idx = ismember(edges(:, [2 1]), path_edges, "rows");
            x(path_edge_idx) = x(path_edge_idx) - maxflow;
            x
        end

    end

end

function residualEdges = residualGraph(edges, flow)
    % return edges : [src dst capacity]
    capacity = edges(:, 3);

    residualEdges = [];

    for i = 1:height(edges)

        if flow(i) < capacity(i)
            residualEdges = [residualEdges; edges(i, [1 2]), capacity(i) - flow(i)];
        end

        if flow(i) > 0
            residualEdges = [residualEdges; edges(i, [2 1]), flow(i)];
        end

    end

end

function [path_edges, max_flow, ns, nt] = augmentingPath(edges, s, t)
    % input edges : [src dst capacity]

    src = edges(:, 1);
    dst = edges(:, 2);
    capacity = edges(:, 3);

    nodes = sort(unique([src dst]));
    predecessor = -ones(size(nodes));
    predecessor(s) = 0;

    queue = queueFIFO;
    queue.push(s);

    while ~queue.isempty
        i = queue.pop();

        if any(src == i & dst == t)
            predecessor(t) = i;
            break
        end

        successors = sort(unique(dst(src == i)));

        for j = successors'

            if predecessor(j) == -1 % && any(src == i & dst == j)
                predecessor(j) = i;
                queue.push(j);
            end

        end

    end

    predecessor

    path_edges = nan;
    max_flow = nan;
    ns = nan;
    nt = nan;

    if predecessor(t) == -1
        ns = find(predecessor ~= -1);
        nt = find(predecessor == -1);
    else

        path = [t];
        k = t;

        while k ~= s
            k = predecessor(k);
            if k == -1; break; end
            path = [k; path];
        end

        path

        path_edges = [path(1:end - 1) path(2:end)]
        path_capac = capacity(ismember(src, path_edges(:, 1)) & ismember(dst, path_edges(:, 2)))
        max_flow = min(path_capac)

    end

end
