module RubyCLI
  # Represents an option that
  # can be added to a command
  # when it is called from
  # the command line
  class Option
    attr_reader :name
    attr_accessor :action
    attr_accessor :aliases

    def initialize(name, &action)
      @name = name
      @action = action
      @aliases = []
    end

    def alias?(name)
      @aliases.include?(name)
    end

    def execute(setup)
      @action.call(setup)
    end
  end
end
