lib_dir = File.dirname(__FILE__) + '/../lib'
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'rubycli'

test_option = RubyCLI::Option.new('test') do |setup|
  setup.add_param('test', true)
end
test_option.aliases << 't'

test = RubyCLI::Command.new('test') do |setup|
  puts 'test' if setup.param?('test') && setup.param('test') == true
end

RubyCLI.register_option(test_option)
RubyCLI.register_command(test)

RubyCLI.process
