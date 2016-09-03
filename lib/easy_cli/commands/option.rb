module EasyCLI
  # Represents an option that
  # can be added to a command
  # when it is called from
  # the command line
  class Option
    # The name of this option
    attr_reader :name
    # The action associated with this option
    attr_accessor :action
    # The aliases defined for this option
    attr_accessor :aliases

    # Creates a new Option with the specified name
    # and action
    #
    # *Params:*
    # +name+:: The name of the option
    # +action+:: The block that represents the action for this option
    def initialize(name, &action)
      @name = name
      @action = action
      @aliases = []
    end

    # Registers an alias for this option
    #
    # *Params:*
    # +a+:: The alias to register
    def alias(a)
      Registry.alias_option(self, a)
    end

    # Executes the action associated with this option
    #
    # *Params:*
    # +setup+:: The Setup of the current environment
    def execute(setup)
      @action.call(setup)
    end
  end
end
