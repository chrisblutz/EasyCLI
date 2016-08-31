module RubyCLI
  # Represents a command that
  # can be executed when
  # it is called from the
  # command line
  class Command
    attr_reader :name
    attr_accessor :action
    @options = []

    def initialize(name, &action)
      @name = name
      @action = action
    end

    def add_option(option)
      @options << option
    end

    def valid?(setup)
    end

    def execute(setup)
      @action.call(setup)
    end
  end
end
