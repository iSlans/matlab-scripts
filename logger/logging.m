function [x, level] = logging(mode)
    % LOGGING set logging level
    % >> logging
    % >> logging info
    % >> logging debug

    arguments
        mode string = ""
    end

    if nargin == 0
        x = log.setgetMode;
        level = log.getLevels().(x);
        return
    end

    if ~isprop(log.getLevels, upper(mode))
        mustBeMember(mode, lower(properties(log)));
    end

    log.setgetMode(mode);

end
