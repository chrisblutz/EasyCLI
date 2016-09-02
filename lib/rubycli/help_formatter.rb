require 'rubycli/registry'

module RubyCLI
  # This class helps
  # to format help messages
  # used by the default
  # help command and --help
  # option
  class HelpFormatter
    class << self
      def format_all
        str = ''
        com_arr = Registry.commands.sort { |a, b| a.name <=> b.name }
        com_arr.each do |command|
          str += "#{format(command)}\n"
        end
        str
      end

      def format(command)
        command.help
      end
    end
  end
end
