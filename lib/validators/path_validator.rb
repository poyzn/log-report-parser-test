# frozen_string_literal: true

module Validators
  # Validators::PathValidator class
  #
  # Validates whether a path is correct
  class PathValidator
    PATTERN = %r{\A/[\w\-]*(/[\w\-]*)?\z}.freeze

    def self.valid?(path)
      PATTERN =~ path ? true : false
    end
  end
end
