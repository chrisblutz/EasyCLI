require_relative 'easy_cli/engine'
require_relative 'easy_cli/registry'

# Provides a command line processing
# module that can parse and process
# arguments, options, and commands
#
# Author:: Christopher Lutz (mailto:lutzblox@gmail.com)
#
# Licensed under the MIT License:
#
# Copyright (c) 2016 Christopher Lutz
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
