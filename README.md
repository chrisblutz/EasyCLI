# EasyCLI
[![Build Status](https://travis-ci.org/chrisblutz/EasyCLI.svg?branch=master)](https://travis-ci.org/chrisblutz/EasyCLI)
[![Gem Version](https://badge.fury.io/rb/easy_cli.svg)](https://badge.fury.io/rb/easy_cli)
[![Inline docs](http://inch-ci.org/github/chrisblutz/EasyCLI.svg?branch=master)](http://inch-ci.org/github/chrisblutz/EasyCLI)

A basic command-line parser for Ruby.

## Usage ##

### Creating Commands ###

To create a command, use the `Command` class, accessible through the `EasyCLI` module:
```ruby
command = EasyCLI::Command.new('command')
```
The `new` method also takes a block parameter, which takes a `Setup` object as its parameter:
```ruby
command = EasyCLI::Command.new('command') do |setup|
  # Place command action here
end
```
If your command requires arguments, you can set minimum and maximum argument numbers by using the following:
```ruby
# The minimum number of arguments required
command.required_args = 1
# The maximum number of arguments allowed
command.max_args = 3
```
To register the command, call the `EasyCLI` module's `register_command` method:
```ruby
EasyCLI.register_command(command)
```

### Creating Options (Flags) ###

To create an option (also known as flags), use the `Option` class, accessible through the `EasyCLI` module:
```ruby
option = EasyCLI::Option.new('option')
```
The `new` method also takes a block parameter, which takes a `Setup` object as its parameter:
```ruby
option = EasyCLI::Option.new('option') do |setup|
  # Place option action here
end
```
To register the option, call the `EasyCLI` module's `register_option` method:
```ruby
EasyCLI.register_option(option)
```

### Using `Setup` And Combining Options and Commands ###

The `Setup` object passed to blocks for commands and actions allows them to store parameters.  For instance, an option might set parameter `test_param` to `true`, and when the command is finally executed, it will see that `test_param` is `true`, and act accordingly:
```ruby
option = EasyCLI::Option.new('option') do |setup|
  setup.add_param('test_param', true)
end
command = EasyCLI::Command.new('command') do |setup|
  if setup.param?('test_param') && setup.param('test_param') == true
    # Do something
  end
end

EasyCLI.register_option(option)
EasyCLI.register_command(command)
```

### Starting the Engine ###

To begin parsing the input passed to the command-line, call the `EasyCLI` module's `process` method:
```ruby
EasyCLI.process
```

### Aliases For Commands and Options ###

#### Commands ####

Commands can also be assigned aliases.  A command alias works similarly to the command itself.  For instance, take the following command:
```ruby
command = EasyCLI::Command.new('command') do |setup|
  # ...
end
```
Calling this command is as simple as this:
```
$ <PROGRAM> command
```
However, you can also add an alias to your command to create a shortcut version by adding the following to your command:
```ruby
command = EasyCLI::Command.new('command') do |setup|
  # ...
end
command.alias('c')
```
Now, you can also call this command like this:
```
$ <PROGRAM> c
```

#### Options ####

*Option aliases are being reworked currently, to allow switches to be added in the future, so they are not included here.*

### The `help` Command ###

By default, **EasyCLI** contains a `help` command, that can take one or no arguments.  It prints the usage and description information about one or all commands (depending on the arguments passed to it).  There is also a default `--help` option, which performs the same action on the command it is applied to.  To fill in this information, the `Command` class provides several methods and variables.

To start, you can set a description for your command:
```ruby
command.description = 'Place description here'
```
Next, you can add argument documentation with the following:
```ruby
command.add_arg_doc('argument_name', 'Place description here')
```
You can also add option/flag documentation and describe their specific effect on the current command:
```ruby
command.add_option_doc(option, 'Place description here')
```

## Copyright ##

Copyright (c) 2016 Christopher Lutz.  See [LICENSE.txt](LICENSE.txt) for more details.
