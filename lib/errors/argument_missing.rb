# frozen_string_literal: true

require './lib/errors/parser_error'

module Errors
  # Errors::ArgumentMissing class
  #
  # Raises when no argument is passed to the parser script
  class ArgumentMissing < ParserError
    def message
      'File argument is missing. Please provide a file'
    end
  end
end
