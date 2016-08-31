require 'rubycli/registry'
require 'rubycli/setup'

module RubyCLI
  # Provides the internal
  # workings for the RubyCLI
  # library
  class Engine
    class << self
      def start
        command = ARGV.shift
        if !command.nil? && Registry.command?(command)

          option_names = []
          option_aliases = []
          args = []

          arg = ARGV.shift
          until arg.nil?
            if arg.start_with?('--')
              option_names << arg[2..-1]
            elsif arg.start_with?('-')
              option_aliases << arg[1..-1]
            else
              args << arg
            end
            arg = ARGV.shift
          end

          setup = Setup.new(args)

          setup = run_options(option_names, option_aliases, setup)

          Registry.retrieve_command(command).execute(setup)
        end
      end

      private

      def run_options(names, aliases, setup)
        names.each do |n|
          Registry.retrieve_option(n).execute(setup) if Registry.option?(n)
        end

        aliases.each do |a|
          if Registry.option_alias?(a)
            Registry.retrieve_option_alias(a).execute(setup)
          end
        end

        setup
      end
    end
  end
end
