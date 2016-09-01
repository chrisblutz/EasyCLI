require 'rubycli'
require 'rubycli/engine'
require 'rubycli/help_formatter'

module RubyCLI
  module Defaults
    def self.register_defaults
      help = RubyCLI::Command.new('help') do |_setup|
        puts HelpFormatter.format_all
        Engine.stop
      end
      help_option = RubyCLI::Option.new('help') do |setup|
        if setup.command.nil?
          puts HelpFormatter.format_all
        else
          puts HelpFormatter.format(setup.command)
        end
        Engine.stop
      end
      help_option.aliases << '?'

      RubyCLI.register_command(help)
      RubyCLI.register_option(help_option)
    end
  end
end
