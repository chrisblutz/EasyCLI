module EasyCLI
  # Provides the Registry
  # in which command and options
  # are stored
  class Registry
    @command_names = []
    @commands = []
    @command_aliases = {}
    @option_names = []
    @options = []
    @option_aliases = {}
    class << self
      # An array containing all registered commands
      attr_reader :commands

      # Registers a new command
      #
      # *Params:*
      # +command+:: The command to register
      def register_command(command)
        @commands << command
        @command_names << command.name
      end

      # Checks if a command with
      # the specified name is registered
      #
      # *Params:*
      # +name+:: The name of the command
      #
      # *Returns:*
      # Whether or not a command
      # with the specified name is registered
      def command?(name)
        @command_names.include?(name) || @command_aliases.key?(name)
      end

      # Retrieves the command
      # with the specified name
      #
      # *Params:*
      # +name+:: The name of the command
      #
      # *Returns:*
      # The command specified by the name
      def command(name)
        if @command_names.include?(name)
          index = @command_names.index(name)
          @commands[index]
        elsif @command_aliases.key?(name)
          @command_aliases[name]
        end
      end

      # Adds an alias to the specified
      # command
      #
      # *Params:*
      # +command+:: The command to register an alias for
      # +a+:: The alias to register
      def alias_command(command, a)
        @command_aliases[a] = command
      end

      # Registers a new option
      #
      # *Params:*
      # +option+:: The option to register
      def register_option(option)
        @options << option
        @option_names << option.name
        option.aliases.each do |a|
          @option_aliases << a
          @a_options << option
        end
      end

      # Checks if an option with
      # the specified name is registered
      #
      # *Params:*
      # +name+:: The name of the option
      #
      # *Returns:*
      # Whether or not an option
      # with the specified name is registered
      def option?(name)
        @option_names.include?(name) || @option_aliases.key?(name)
      end

      # Retrieves the option
      # with the specified name
      #
      # *Params:*
      # +name+:: The name of the option
      #
      # *Returns:*
      # The option specified by the name
      def option(name)
        if @option_names.include?(name)
          index = @option_names.index(name)
          @options[index]
        elsif @option_aliases.key?(name)
          @option_aliases[name]
        end
      end

      # Adds an alias to the specified
      # option
      #
      # *Params:*
      # +option+:: The option to register an alias for
      # +a+:: The alias to register
      def alias_option(option, a)
        @option_aliases[a] = option
      end
    end
  end
end
