require 'rubycli/registry'

module RubyCLI
  class HelpFormatter
    class << self
      def format_all
        str = ''
        Registry.commands.each do |command|
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
