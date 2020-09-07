# frozen_string_literal: true

module Repositories
  # Repositories::PathInfo class
  #
  # Class for storing metrict for a single unique path
  class PathInfo
    attr_accessor :visits, :users, :ips

    def initialize
      @visits = 0
      @users = 0
      @ips = []
    end
  end
end
