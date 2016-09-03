module EasyCLI
  # Provides an interface
  # for determining the
  # host operating system
  # of the running program
  module OS
    # Checks if the host OS is a Windows operating system
    #
    # *Returns:*
    # Whether or not the host OS is Windows-based
    def self.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/i =~ host_os) != nil
    end

    # Checks if the host OS is a Mac operating system
    #
    # *Returns:*
    # Whether or not the host OS is Mac-based
    def self.mac?
      (/darwin|mac os/i =~ host_os) != nil
    end

    # Checks if the host OS is a Unix operating system
    #
    # *Returns:*
    # Whether or not the host OS is Unix-based
    def self.unix?
      !windows?
    end

    # Checks if the host OS is a Linux operating system
    #
    # *Returns:*
    # Whether or not the host OS is Linux-based
    def self.linux?
      unix? && !mac?
    end

    # Retrieves the host OS
    #
    # *Returns:*
    # The host os, as defined by RbConfig::CONFIG['host_os']
    def self.host_os
      RbConfig::CONFIG['host_os']
    end
  end
end
