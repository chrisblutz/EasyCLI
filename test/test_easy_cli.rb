require 'minitest/autorun'
require 'easy_cli'

# Tests for EasyCLI
class EasyCLITest < Minitest::Test
  def test_defaulting_command_methods
    c = EasyCLI::Command.new('test') {}
    assert_equal(0, c.required_args)
    assert_equal(-1, c.max_args)
    assert_equal(EasyCLI::Defaults::DEFAULT_DESCRIPTION, c.description)
  end

  def test_commands
    c = EasyCLI::Command.new('test_command') do |_setup|
      assert(true)
    end
    ARGV.clear
    ARGV << 'test_command'
    EasyCLI.register_command(c)
    EasyCLI.process
  end

  def test_options
    o = EasyCLI::Option.new('test_options') do |_setup|
      assert(true)
    end
    ARGV.clear
    ARGV << '--test_options'
    EasyCLI.register_option(o)
    EasyCLI.process
  end

  def test_command_with_options
    o = EasyCLI::Option.new('test_cwo') do |setup|
      setup.add_param('option', true)
    end
    c = EasyCLI::Command.new('test_cwo') do |setup|
      assert(setup.param?('option') && setup.param('option') == true)
    end
    ARGV.clear
    ARGV << 'test_cwo'
    ARGV << '--test_cwo'
    EasyCLI.register_option(o)
    EasyCLI.register_command(c)
    EasyCLI.process
  end
end
