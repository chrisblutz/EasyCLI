
module RubyCLI
  # Provides the Registry
  # in which command blocks
  # are stored
  class Registry
    @command_names = []
    @commands = []
    @option_names = []
    @option_aliases = []
    @options = []
    @a_options = []
    class << self
      def register_command(command)
        @commands << command
        @command_names << command.name
      end

      def command?(name)
        @command_names.include?(name)
      end

      def retrieve_command(name)
        index = @command_names.index(name)
        @commands[index]
      end

      def register_option(option)
        @options << option
        @option_names << option.name
        option.aliases.each do |a|
          @option_aliases << a
          @a_options << option
        end
      end

      def option?(name)
        @option_names.include?(name)
      end

      def option_alias?(alias_name)
        @option_aliases.include?(alias_name)
      end

      def retrieve_option(name)
        index = @option_names.index(name)
        @options[index]
      end

      def retrieve_option_alias(alias_name)
        index = @option_aliases.index(alias_name)
        @a_options[index]
      end
    end
  end
end
