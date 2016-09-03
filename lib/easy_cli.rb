require_relative 'easy_cli/engine'
require_relative 'easy_cli/registry'

# Provides a command line processing
# module that can parse and process
# arguments, options, and commands
#
# Author:: Christopher Lutz (mailto:lutzblox@gmail.com)
module EasyCLI
  autoload :Command, 'easy_cli/commands/command'
  autoload :Option, 'easy_cli/commands/option'
  autoload :Defaults, 'easy_cli/commands/defaults'
  autoload :Engine, 'easy_cli/engine'

  # Registers a command to be recognized
  # by the parser
  #
  # *Params:*
  # +command+:: The command to register
  def self.register_command(command)
    Registry.register_command(command)
  end

  # Registers a option to be recognized
  # by the parser
  #
  # *Params:*
  # +option+:: The option to register
  def self.register_option(option)
    Registry.register_option(option)
  end

  # Begins the parsing process
  # and starts the processing
  # engine
  def self.process
    Engine.start
  end
end
