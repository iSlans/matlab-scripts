% myaddpath(pwd)
% myaddpath("./scripts")

function myaddpath(dir)
    p = split(genpath(dir), ':');
    p = p(~contains(p, '.git'));
    p = p(~contains(p, '.vscode'));
    paths = p;
    p = join(p, ':');
    addpath(p{1});

    savepath
    disp("added paths: ")
    disp(paths)
end
