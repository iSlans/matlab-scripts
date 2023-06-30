function symrat(bool)
    % shortcut for sympref("FloatingPointOutput", bool)
    % symrat
    % symrat(0)
    arguments
        bool = true
    end

    sympref("FloatingPointOutput", ~logical(bool));
end
