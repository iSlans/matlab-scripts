b = [-40 -30 -10 20 30 30]
edges = [
% from, to, cost [, capacity]
    1 2 4
    1 3 7
    2 4 3
    3 2 8
    3 4 2
    3 5 5
    4 5 6
    4 6 9
    5 6 11
    ]

% fun(b, edges)
% function fun(b, edges)

assert(sum(b) == 0, "sum balances must be 0")

src = edges(:, 1);
dst = edges(:, 2);
cost = edges(:, 3);
capacity = [];

if size(edges, 2) == 4
    capacity = edges(:, 4);
end

n = length(b);
m = size(edges, 1);
E = digraph(src, dst, cost).incidence
% E = zeros(n, m);
% for i = 1:m
%     E(src(i), i) = -1;
%     E(dst(i), i) = 1;
% end

aux_c = [cost * 0; ones(n, 1)]
aux_x = linprog(aux_c, [], [], [E eye(n)], b, aux_c * 0, capacity)
% aux_x = linprog(cost, [], [], E, b, cost * 0, capacity)

T = aux_x(1:m) ~= 0;
L = aux_x(1:m) == 0;

% ---------------------------------------------------------------------------- %
%                                find potentials                               %
% ---------------------------------------------------------------------------- %

syms('pot', [length(b) 1])
eqs = -pot(src(T)) + pot(dst(T)) == cost(T);
eqs = [pot1 == 0; eqs]
% potentials = solve(eqs)

[A, B] = equationsToMatrix(eqs)
potentials = A \ B

E(:, T) \ [0; cost(T)]

% ---------------------------------------------------------------------------- %
%                              find entering index                             %
% ---------------------------------------------------------------------------- %

diff_pot = logical(-potentials(src) + potentials(dst) <= cost)

% automatically in L
no_bellman_edges = edges(diff_pot == 0, :)
% return

TT = digraph(src(T), dst(T), cost(T))

entering = no_bellman_edges(1, 1:2)
% entering = [3 4]
TT = addedge(TT, entering(1), entering(2), 7)

% ---------------------------------------------------------------------------- %
%                                  find cycle                                  %
% ---------------------------------------------------------------------------- %

% find cycle by using undirected graph
cycle_g = graph(TT.adjacency + TT.adjacency');
[cycle_path, ~] = cycle_g.allcycles;

assert(length(cycle_path) == 1)

% trick to find C⁺ and C⁻ from the cycle node sequence
cycle_path = cycle_path{1};

src_cycle_nodes = cycle_path;
dst_cycle_nodes = circshift(cycle_path, -1);

hh = [src_cycle_nodes' dst_cycle_nodes'];

if ~any(ismember(hh, entering, "rows"))
    hh = [dst_cycle_nodes' src_cycle_nodes'];
end

assert(any(ismember(hh, entering, "rows")), "error: entering index is not in the cycle")

c_plus_index = TT.findedge(hh(:, 1), hh(:, 2)) ~= 0
c_minus_index = ~c_plus_index

c_plus_edges = hh(c_plus_index, :)
c_minus_edges = hh(c_minus_index, :)

reduced_cost = cost + potentials(src) - potentials(dst)

minusedges = ismember(edges(:, 1:2), c_minus_edges(:, 2:-1:1), "rows")
% delta = min(reduced_cost(minusedges))
delta = min(reduced_cost(minusedges))
exiting_k = find(reduced_cost == delta, 1)

exiting = edges(exiting_k, 1:2)

return
% nexttile
% plot(cycle_g)
nexttile

g = digraph(src, dst, cost);
p = plot(g, "EdgeLabel", g.Edges.Weight, "NodeLabel", [1:n].' + " π="+string(potentials));
highlight(p, TT)

highlight(p, c_plus_edges(:, 1), c_plus_edges(:, 2), "EdgeColor", "green")
highlight(p, c_minus_edges(:, 2), c_minus_edges(:, 1), "EdgeColor", "red")

% end
