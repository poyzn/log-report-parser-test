# frozen_string_literal: true

require './lib/errors/parser_error'

module Errors
  # Errors::FileNotFound class
  #
  # Raises when icomng file is not found
  class FileNotFound < ParserError
    def message
      'File not found'
    end
  end
end
