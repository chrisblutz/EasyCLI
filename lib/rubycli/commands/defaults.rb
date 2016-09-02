require 'rubycli'
require 'rubycli/engine'
require 'rubycli/help_formatter'
require 'rubycli/os'

module RubyCLI
  # Contains the default
  # help command and --help
  # option.  This command/option
  # retrieves the information
  # from the respective command's
  # help method.
  module Defaults
    def self.register_defaults
      help = create_help_command
      help.alias('/?') if OS.windows?
      help.max_args = 1
      help.add_arg_doc('command', 'The command to view help for (optional)')
      help.description = 'Shows help for commands.  A specific command can be specified by' \
                         ' entering the name as an argument.'
      help_option = create_help_option
      help_option.aliases << '?'

      RubyCLI.register_command(help)
      RubyCLI.register_option(help_option)
    end

    def self.create_help_command
      RubyCLI::Command.new('help') do |setup|
        if setup.args.length.zero?
          puts HelpFormatter.format_all
        elsif Registry.command?(setup.args[0])
          puts HelpFormatter.format(Registry.retrieve_command(setup.args[0]))
        end
        Engine.stop
      end
    end

    def self.create_help_option
      RubyCLI::Option.new('help') do |setup|
        if setup.command.nil?
          puts HelpFormatter.format_all
        else
          puts HelpFormatter.format(setup.command)
        end
        Engine.stop
      end
    end
  end
end
