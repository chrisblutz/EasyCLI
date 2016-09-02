module RubyCLI
  # Provides an interface
  # for determining the
  # host operating system
  # of the running program
  module OS
    def self.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/i =~ host_os) != nil
    end

    def self.mac?
      (/darwin|mac os/i =~ host_os) != nil
    end

    def self.unix?
      !windows?
    end

    def self.linux?
      unix? && !mac?
    end

    def self.host_os
      RbConfig::CONFIG['host_os']
    end
  end
end
