require 'easy_cli/registry'

module EasyCLI
  # This class helps
  # to format help messages
  # used by the default
  # help command and --help
  # option
  class HelpFormatter
    class << self
      # Formats the help lines of all commands
      # into a string
      #
      # *Returns:*
      # The help strings of all registered commands
      # combined into a single string
      def format_all
        str = ''
        com_arr = Registry.commands.sort { |a, b| a.name <=> b.name }
        com_arr.each do |command|
          str += "#{format(command)}\n"
        end
        str
      end

      # Retrieves the help line of the specified command
      #
      # *Params:*
      # +command+:: The command to retrieve help for
      #
      # *Returns:*
      # The help string of the specified command
      def format(command)
        command.help
      end
    end
  end
end
