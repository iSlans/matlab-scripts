classdef log

    properties (Constant)
        INFO = 10
        DEBUG = 20
    end

    methods (Static)

        % log functions, corresponding to log levels

        function info(msg)
            log.print(msg, log.INFO)
        end

        function debug(msg)
            log.print(msg, log.DEBUG)
        end

        % ------------------------------------------

        % Method to set log level
        function x = setgetMode(mode)

            persistent logLevelName

            if isempty(logLevelName)
                log.logLevel(log.INFO);
                logLevelName = "INFO";
            end

            x = logLevelName;

            if nargin == 0
                return
            end

            mode = string(mode);
            upper_mode = upper(mode);

            if isprop(log, upper_mode)
                log.logLevel(log.(upper_mode));
                logLevelName = upper_mode;
            end

        end

    end

    methods (Static, Access = private)

        function x = logLevel(lv)
            persistent level

            if nargin == 0
                x = level;
                return
            end

            level = lv;
        end

        function print(msg, level)
            curLevel = logLevel;

            if curLevel >= level
                fprintf(msg)
            end

        end

    end

end
