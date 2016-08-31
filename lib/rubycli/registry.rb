
module RubyCLI
  # Provides the Registry
  # in which command blocks
  # are stored
  class Registry
    @names = []
    @commands = []

    def self.register_command(command)
      @commands << command
      @names << command.name
    end

    def self.command?(name)
      @names.include?(name)
    end

    def self.retrieve_action(name)
      index = @names.index(name)
      @commands[index]
    end
  end
end
