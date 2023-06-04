classdef log
    % LOG custom log system
    % set a log level using <logging> command
    % ex.
    %   >> logging info
    %   >> logging debug
    %
    % all logs with (level <= current level) will be printed
    %

    properties (Constant)
        ERROR = 5
        WARNING = 7
        INFO = 10
        DEBUG = 20
        ALL = 100
    end

    methods (Static)

        % --------------------- log functions for every log level -------------------- %
        function info(msg, varargin)
            log.print(log.INFO, msg, varargin{:})
        end

        function error(msg, varargin)
            log.print(log.ERROR, msg, varargin{:})
        end

        function warning(msg, varargin)
            log.print(log.WARNING, msg, varargin{:})
        end

        function debug(msg, varargin)
            log.print(log.DEBUG, msg, varargin{:})
        end

        % ---------------- ------------------------------------------ ---------------- %

        % Method to set log level, used by <logging> command
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

        function l = getLevels()
            l = log;
        end

    end

    methods (Static, Access = private)

        function x = logLevel(lv)
            persistent level

            if isempty(level)
                level = (log.INFO);
                x = level;
            end

            if nargin == 0
                x = level;
                return
            end

            level = lv;
        end

        function print(level, msg, varargin)
            curLevel = log.logLevel;

            if curLevel >= level
                fprintf(msg, varargin{:});
            end

        end

    end

    methods (Access = private, Hidden)

        function obj = log()
        end

    end

end
