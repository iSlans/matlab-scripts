format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

b = [-2 -4 -6 5 6 1];
edges = [
    1 2 3 7
    1 3 5 7
    2 3 4 5
    2 4 4 12
    2 6 5 4
    3 4 4 5
    3 5 10 7
    3 6 5 10
    4 6 3 11
    5 6 7 9
    ];

t = [
    1 3
    2 3
    3 5
    4 6
    5 6
    ];

u = [3 4];

% flowSimplex(b, edges, t, u)

% ---------------------------------------------------------------------------- %
%                               min path dijkstra                              %
% ---------------------------------------------------------------------------- %

root = 1;
% dijkstra(edges(:, [1 2 3]), root)

% % check by simplex
% b = [-5 1 1 1 1 1]
% flowSimplex(b, edges, t, u)

% % check by matlab built-in
% g = digraph(edges(:, 1), edges(:, 2), edges(:, 3));
% g.shortestpathtree(root).Edges
% plot(g.shortestpathtree(root))

% ---------------------------------------------------------------------------- %
%                            max flow fordFulkerson                            %
% ---------------------------------------------------------------------------- %

ed = edges(:, [1 2 4]);
root = 1;
destination = 6;

% fordFulkerson(ed, root, destination)

% % % check by matlab built in
% g = digraph(edges(:, 1), edges(:, 2), edges(:, 4));
% [maxf, gg, ns, nd] = g.maxflow(root, destination)
