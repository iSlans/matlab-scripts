function myaddpath(dir)
    p = split(genpath(dir), ':');
    p = p(~contains(p, '.git'));
    p = p(~contains(p, '.vscode'));
    p = join(p, ':');
    addpath(p{1});

    savepath
end
