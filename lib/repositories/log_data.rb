# frozen_string_literal: true

module Repositories
  # Repository::LogData class
  #
  # Class for storing log metrics
  class LogData
    attr_accessor :paths

    def initialize
      @paths = {}
    end
  end
end
