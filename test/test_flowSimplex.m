b = [-6 -6 -5 2 3 4 8]';
edges = [
    1 2 6 11
    1 3 10 7
    1 4 3 9
    2 4 5 12
    3 5 4 7
    4 3 4 9
    4 6 8 12
    5 4 5 7
    5 7 4 9
    6 5 4 6
    6 7 4 11
    ];

T = [
    1 4
    2 4
    4 3
    4 6
    5 4
    6 7
    ];

U = [
    3 5
    ];

% [flow, pot] = flowSimplex(b, edges, T, U)

b = [-6 1 1 1 1 1 1]

n = length(b);
m = size(edges, 1);
fullgraph = digraph(edges(:, 1), edges(:, 2), edges(:, 3))
E = fullgraph.incidence

aux_c = [edges(:, 3) * 0; ones(n, 1)]
% aux_x = linprog(aux_c, [], [], [E eye(n)], b, aux_c * 0, edges(:, 4))

% T = edges(aux_x > 0, 1:2)

% [flow, pot] = flowSimplex(b, edges, T, U)

% MIN path
c = edges(:, 3)
Aeq = E
beq = b
lb = repmat(0, length(c), 1)
ub = edges(:, 4)

ub(end) = 0

x = linprog(c, [], [], Aeq, beq, lb, ub)

edges(x > 0, 1:2)

xx = [1, 0, 4, 0, 2, 3, 1, 0, 1, 0, 0]

p = plot(fullgraph, EdgeLabel = xx)

highlight(p, edges(x > 0, 1), edges(x > 0, 2))

fullgraph.shortestpathtree(1, Method = 'positive')

capacitygraph = digraph(edges(:, 1), edges(:, 2), edges(:, 4))

capacitygraph.maxflow(1, 7, 'augmentpath')
