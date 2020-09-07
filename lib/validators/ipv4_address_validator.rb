# frozen_string_literal: true

module Validators
  # Validators::Ipv4AddressValidator class
  #
  # Validates IPv4 address
  class Ipv4AddressValidator
    # Real IP address regexp pattern
    # PATTERN = /\A((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/.freeze
    PATTERN = /\A([0-9]{1,3}\.){3}[0-9]{1,3}\z/.freeze

    def self.valid?(address)
      PATTERN =~ address ? true : false
    end
  end
end
