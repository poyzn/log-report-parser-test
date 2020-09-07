# frozen_string_literal: true

module Presenters
  # Presenters::ErrorMessagePresenter
  #
  # Decorates error message
  class ErrorMessagePresenter
    def self.call(message)
      "Program stopped with error: #{message}"
    end
  end
end
