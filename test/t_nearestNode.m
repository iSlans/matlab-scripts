A = [
    1e3 33 39 35 60
    33 1e3 33 29 54
    13 46 1e3 12 30
    25 58 12 1e3 23
    33 76 30 23 1e3
    ];
A = A';

[path, cost] = nearestNode(A, 1)
[path, cost] = nearestNode(A, 5)
