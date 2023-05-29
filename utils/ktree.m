function tree = ktree(graph, root)
    % KTREE
    % Example
    % % create a undirected graph object, with node names from "1" to n, from the upper triangular matrix
    % A = [
    %  0 24 21 20 9
    %  0 0 23 40 13
    %  0 0 0 30 25
    %  0 0 0 0 28
    %  0 0 0 0 0
    % ];
    % g = graph(A, string(1:length(A)), "upper");
    %
    % % to visualize it
    % tree = ktree(g, 5)
    % p = plot(g);
    % highlight(p, tree)
    %
    % % or just get the edges
    % disp(tree.Edges)

    arguments
        graph {mustBeA(graph, "graph")}
        root string
    end

    % -------------------- minimum spanning tree with Kruskal -------------------- %

    graph_no_root = rmnode(graph, root);
    [tree, pred] = minspantree(graph_no_root, Method = "sparse", Type = "tree");

    % --------------------------- connect root to tree --------------------------- %

    tree = tree.addnode(root);
    tree = reordernodes(tree, sort(tree.Nodes.Name));

    root_edges = graph.Edges(outedges(graph, root), :);

    % find the two min edges from root to spanning tree
    [~, idx] = sort(root_edges.Weight);
    min_edges = root_edges(idx(1:2), :);

    tree = addedge(tree, min_edges);
end
