lib_dir = File.dirname(__FILE__) + '/../lib'
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

ARGV << 'test'
ARGV << '--test'

require 'rubycli'

test = RubyCLI::Command.new('test') do
  puts 'test'
end

RubyCLI.register_command(test)

RubyCLI.process
