function str = str(o)

    if (isvector(o))
        str = join(string(o), ' ');
        str = sprintf("[ %s ]", str);
    else
        str = "str: unknow type \n";
    end

end
