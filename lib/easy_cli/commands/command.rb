require 'easy_cli/registry'

module EasyCLI
  # Represents a command that
  # can be executed when
  # it is called from the
  # command line
  class Command
    # The name of this command
    attr_reader :name
    # The action associated with this command
    attr_accessor :action
    # The description for this command (used by the help command)
    attr_writer :description
    # The minimum number of arguments required for this command
    attr_writer :required_args
    # The maximum number of arguments allowed for this command
    attr_writer :max_args

    # Creates a new Command with the specified name
    # and action
    #
    # *Params:*
    # +name+:: The name of the command
    # +action+:: The block that represents the action for this command
    def initialize(name, &action)
      @name = name
      @action = action
      @doc_args = {}
      @doc_options = {}
    end

    # Registers an alias for this command
    #
    # *Params:*
    # +a+:: The alias to register
    def alias(a)
      Registry.alias_command(self, a)
    end

    # Adds documentation for an option to this command.
    # This functionality is used by the help command.
    #
    # *Params:*
    # +option+:: The option to register a description for
    # +description+:: The description to register
    def add_option_doc(option, description)
      @doc_options[option] = description
    end

    # Adds documentation for an argument to this command.
    # This functionality is used by the help command.
    #
    # *Params:*
    # +arg_name+:: The name of the argument to register a description for
    # +description+:: The description to register
    def add_arg_doc(arg_name, description)
      @doc_args[arg_name] = description
    end

    # Retrieves the description for this command
    #
    # *Returns:*
    # The description of this command, or a default message if the description is nil
    def description
      @description || 'No description provided!'
    end

    # Retrieves the minimum number of arguments required for this command
    #
    # *Returns:*
    # The minimum number of arguments for this command, or 0 if the required_args variable is nil
    def required_args
      @required_args || 0
    end

    # Retrieves the maximum number of arguments allowed for this command
    #
    # *Returns:*
    # The maximum number of arguments allowed, or -1 (no limit) if the max_args variable is nil
    def max_args
      @max_args || -1
    end

    # Checks if the current Setup is valid for this command
    #
    # *Params:*
    # +setup+:: The Setup of the current environment
    #
    # *Returns:*
    # Whether or not the current Setup is valid for this command
    def valid?(setup)
      setup.args.length >= required_args && (max_args == -1 || setup.args.length <= max_args)
    end

    # Executes the action associated with this command
    #
    # *Params:*
    # +setup+:: The Setup of the current environment
    def execute(setup)
      @action.call(setup)
    end

    # Retrieves the help string for this command.
    # This method combines the description, arguments,
    # and options for this command into a single string.
    #
    # *Returns:*
    # The help string for this command
    def help
      str = "====[ #{@name} ]====\nUsage: #{@name} "
      @doc_args.each do |key, _value|
        str += "[#{key.upcase}] "
      end
      @doc_options.each do |key, _value|
        str += "(--#{key.name}) "
      end
      str = "#{str.rstrip}\nDescription: #{description}\n#{help_options_args}"
      str.rstrip
    end

    private

    def help_options_args
      str = ''
      unless @doc_args.empty?
        str += "Arguments:\n"
        @doc_args.each do |key, value|
          str += "- #{key.upcase}: #{value}\n"
        end
      end
      unless @doc_options.empty?
        str += "Options/Flags:\n"
        @doc_options.each do |key, value|
          str += "- #{key.name}: #{value}\n"
        end
      end
      str
    end
  end
end
