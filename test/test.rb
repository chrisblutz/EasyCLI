lib_dir = File.dirname(__FILE__) + '/../lib'
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'easy_cli'

test_option = EasyCLI::Option.new('test') do |setup|
  setup.add_param('test', true)
end
test_option.aliases << 't'

test = EasyCLI::Command.new('test') do |setup|
  puts 'test' if setup.param?('test') && setup.param('test') == true
end
test.add_option_doc(test_option, 'A test option')
test.add_arg_doc('test_arg', 'A test argument')
test.add_arg_doc('another_arg', 'Another argument')

EasyCLI.register_option(test_option)
EasyCLI.register_command(test)

EasyCLI.process
