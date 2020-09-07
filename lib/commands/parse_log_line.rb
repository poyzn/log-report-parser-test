# frozen_string_literal: true

module Commands
  # Commands::ParseLogLine class
  #
  # Splits log line into path and ip
  class ParseLogLine
    def self.call(line)
      line.split ' '
    end
  end
end
