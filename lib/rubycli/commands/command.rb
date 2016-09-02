require 'rubycli/registry'

module RubyCLI
  # Represents a command that
  # can be executed when
  # it is called from the
  # command line
  class Command
    attr_reader :name
    attr_accessor :action
    attr_writer :description
    attr_writer :required_args
    attr_writer :max_args

    def initialize(name, &action)
      @name = name
      @action = action
      @doc_args = {}
      @doc_options = {}
    end

    def alias(a)
      Registry.alias_command(self, a)
    end

    def add_option_doc(option, description)
      @doc_options[option] = description
    end

    def add_arg_doc(arg_name, description)
      @doc_args[arg_name] = description
    end

    def description
      @description || 'No description provided!'
    end

    def required_args
      @required_args || 0
    end

    def max_args
      @max_args || -1
    end

    def valid?(setup)
      setup.args.length >= required_args && (max_args == -1 || setup.args.length <= max_args)
    end

    def execute(setup)
      @action.call(setup)
    end

    def help
      str = "====[ #{@name} ]====\nUsage: #{@name} "
      @doc_args.each do |key, _value|
        str += "[#{key.upcase}] "
      end
      @doc_options.each do |key, _value|
        str += "(--#{key.name}) "
      end
      str = "#{str.rstrip}\nDescription: #{description}\n#{help_options_args}"
      str.rstrip
    end

    def help_options_args
      str = ''
      unless @doc_args.empty?
        str += "Arguments:\n"
        @doc_args.each do |key, value|
          str += "- #{key.upcase}: #{value}\n"
        end
      end
      unless @doc_options.empty?
        str += "Options/Flags:\n"
        @doc_options.each do |key, value|
          str += "- #{key.name}: #{value}\n"
        end
      end
      str
    end
  end
end
