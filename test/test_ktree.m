tiledlayout("flow");

% A = [
%     0 3 6 0 0 9
%     0 0 4 3 0 0
%     0 0 0 1 1 8
%     0 0 0 0 2 0
%     0 0 0 0 0 7
%     0 0 0 0 0 0
%     ];

% A = [
%     0 11 23 36 31
%     0 0 15 25 24
%     0 0 0 27 34
%     0 0 0 0 29
%     0 0 0 0 0
%     ];

A = [
    0 24 21 20 9
    0 0 23 40 13
    0 0 0 30 25
    0 0 0 0 28
    0 0 0 0 0
    ];

g = graph(A, string(1:length(A)), "upper");
tree = ktree(g, 5)

nexttile
p = plot(g);
highlight(p, tree)

nexttile
plot(tree)
