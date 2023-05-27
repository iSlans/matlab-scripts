function x = logging(mode)
    % LOGGING set logging level
    % >> logging
    % >> logging info
    % >> logging debug

    arguments
        mode string = ""
    end

    if nargin == 0
        x = log.setgetMode;
        return
    end

    if ~isprop(log, upper(mode))
        mustBeMember(mode, lower(properties(log)));
    end

    log.setgetMode(mode);

end
