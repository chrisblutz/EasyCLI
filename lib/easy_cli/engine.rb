require 'easy_cli/registry'
require 'easy_cli/setup'
require 'easy_cli/commands/defaults'

module EasyCLI
  # Provides the internal
  # workings for the RubyCLI
  # library
  class Engine
    @option_names = []
    @switches = []
    @args = []
    @continue = true
    class << self
      # Begins the parsing process
      def start
        Defaults.register_defaults

        command = ARGV.shift
        return if command.nil?
        parse_args
        parse_line(command)
      end

      # Tells the engine to stop
      # parsing after completing
      # the current task
      def stop
        @continue = false
      end

      private

      def parse_line(command)
        if Registry.command?(command)
          run_command(command)
        elsif command.start_with?('--') && Registry.option?(command[2..-1])
          @option_names << command[2..-1]
          run_options(Setup.new(nil, @args))
        end
      end

      def run_command(command)
        c = Registry.command(command)

        setup = run_options(Setup.new(c, @args))

        return if @continue == false || !c.valid?(setup)

        c.execute(setup)
      end

      def parse_args
        arg = ARGV.shift
        until arg.nil?
          if arg.start_with?('--')
            @option_names << arg[2..-1]
          elsif arg.start_with?('-')
            @switches << arg[1..-1]
          else
            @args << arg
          end
          arg = ARGV.shift
        end
      end

      def run_options(setup)
        @option_names.each do |n|
          break if @continue == false
          Registry.option(n).execute(setup) if Registry.option?(n)
        end

        setup
      end
    end
  end
end
