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

    def initialize(args = [])
      @args = args
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
