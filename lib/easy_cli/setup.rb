module EasyCLI
  # Represents the current
  # setup and environment
  # for the command currently
  # being run.  It contains
  # parameters set by options,
  # and general information
  # about the command or
  # environment in question
  class Setup
    # The arguments passed to the command line
    attr_accessor :args
    # The command passed to the command line (or nil, if no command was passed)
    attr_reader :command

    # Creates a new Setup, for the specified command with
    # the specified arguments.
    #
    # *Params:*
    # +command+:: The command passed to the command line
    # +args+:: The arguments passed to the command line
    def initialize(command, args = [])
      @args = args
      @command = command
      @params = {}
    end

    # Adds a parameter to this setup
    #
    # *Params:*
    # +name+:: The name of the parameter
    # +value+:: The value of the parameter
    def add_param(name, value)
      @params[name] = value
    end

    # Checks if a parameter exists with
    # the specified name
    #
    # *Params:*
    # +name+:: The name of the parameter
    #
    # *Returns:*
    # Whether or not a parameter exists
    # with the specified name
    def param?(name)
      @params.key?(name)
    end

    # Retrieves the value of the parameter
    # with the specified name
    #
    # *Params:*
    # +name+:: The name of the parameter
    #
    # *Returns:*
    # The value of the parameter specified by the name
    def param(name)
      @params[name]
    end
  end
end
