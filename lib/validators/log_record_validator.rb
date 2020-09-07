# frozen_string_literal: true

require './lib/validators/path_validator'
require './lib/validators/ipv4_address_validator'

module Validators
  # Validators::LogRecordValidator class
  #
  # Validates a single log line
  class LogRecordValidator
    def self.valid?(path, ip)
      PathValidator.valid?(path) && Ipv4AddressValidator.valid?(ip)
    end
  end
end
