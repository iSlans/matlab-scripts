format compact
format rational
% format short

logging all
% logging debug

% ------------------------------------- - ------------------------------------ %

b = [-3 -6 -6 6 3 6];
edges = [
    1 2 8 7
    1 4 8 8
    1 5 3 10
    2 3 6 11
    2 4 5 9
    3 4 8 9
    4 5 5 6
    4 6 10 8
    5 6 9 10
    ];

t = [
    1 2
    2 3
    2 4
    4 5
    4 6
    ];

u = [3 4];

% RicOp.flowSimplex(edges, b', t, u, 1);
flowSimplex(b, edges, t, u)

%%
% ---------------------------------------------------------------------------- %
%                               min path dijkstra                              %
% ---------------------------------------------------------------------------- %

root = 1;
% dijkstra(edges(:, [1 2 3]), root)

% check by simplex
% b = [-5 1 1 1 1 1]
% flowSimplex(b, edges, t, u)

% % check by matlab built-in
% g = digraph(edges(:, 1), edges(:, 2), edges(:, 3));
% g.shortestpathtree(root).Edges
% plot(g.shortestpathtree(root))

%%
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
