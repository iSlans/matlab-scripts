% license("checkout", "symbolic_toolbox")

c = [12 7 0 0];
A = [
    8 7 -1 0
    6 8 0 -1
    ];
b = [52 41];

% cuts = gomory(c, A, b);

c =- [9 6];
A = [
    9 5 1 0
    6 8 0 1
    ];
b = [65 61];

% gomory(c, A, b);

c =- [5 14];
A = [
    18 8 1 0
    14 18 0 1
    ];
b = [55 61];

gomory(c, A, b);
