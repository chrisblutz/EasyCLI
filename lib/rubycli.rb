dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require 'rubycli/engine'
require 'rubycli/registry'

# Provides a command line processing
# module that can parse and process
# arguments and commands
module RubyCLI
  autoload :Command, 'rubycli/commands/command'
  autoload :Option, 'rubycli/commands/option'

  def self.register_command(command)
    Registry.register_command(command)
  end

  def self.process
    Engine.start
  end
end
