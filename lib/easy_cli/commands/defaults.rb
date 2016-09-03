require 'easy_cli/help_formatter'
require 'easy_cli/os'
require 'easy_cli/registry'

module EasyCLI
  # Contains the default
  # help command and --help
  # option.  This command/option
  # retrieves the information
  # from the respective command's
  # help method.
  class Defaults
    DEFAULT_DESCRIPTION = 'No description provided!'.freeze
    class << self
      # Registers the default commands
      # for this library
      def register_defaults
        help = create_help_command
        help.alias('/?') if OS.windows?
        help.max_args = 1
        help.add_arg_doc('command', 'The command to view help for (optional)')
        help.description = 'Shows help for commands.  A specific command can be specified by' \
                           ' entering the name as an argument.'
        help_option = create_help_option
        help_option.alias('?')

        Registry.register_command(help)
        Registry.register_option(help_option)
      end

      private

      def create_help_command
        EasyCLI::Command.new('help') do |setup|
          if setup.args.length.zero?
            puts HelpFormatter.format_all
          elsif Registry.command?(setup.args[0])
            puts HelpFormatter.format(Registry.retrieve_command(setup.args[0]))
          end
          EasyCLI::Engine.stop
        end
      end

      def create_help_option
        EasyCLI::Option.new('help') do |setup|
          if setup.command.nil?
            puts HelpFormatter.format_all
          else
            puts HelpFormatter.format(setup.command)
          end
          EasyCLI::Engine.stop
        end
      end
    end
  end
end
