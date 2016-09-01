module RubyCLI
  # Represents the current
  # setup and environment
  # for the command currently
  # being run.  It contains
  # parameters set by options,
  # and general information
  # about the command or
  # environment in question
  class Setup
    attr_accessor :args
    attr_reader :command

    def initialize(command, args = [])
      @args = args
      @command = command
      @params = {}
    end

    def add_param(name, value)
      @params[name] = value
    end

    def param?(name)
      @params.key?(name)
    end

    def param(name)
      @params[name]
    end
  end
end
