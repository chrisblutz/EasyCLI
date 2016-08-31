require 'rubycli/registry'

module RubyCLI
  # Provides the internal
  # workings for the RubyCLI
  # library
  class Engine
    def self.start
      command = ARGV.shift
      if !command.nil? && Registry.command?(command)
        setup = nil # TODO: Retrieve setup
        Registry.retrieve_action(command).execute(setup)
      end
    end
  end
end
