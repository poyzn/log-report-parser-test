# frozen_string_literal: true

require './lib/reports/base_report'

module Reports
  # Reports::AverageReport class
  #
  # Generate a report by average user
  class AverageReport < BaseReport
    private

    def title
      "Average\n"
    end

    # Sorts paths stored in repository in reverse order
    def sorted_paths
      @log_data.paths.sort_by { |_path, info| avg(info) }.reverse
    end

    # Decorates a report line
    def decorated_path(path)
      "#{path} #{avg(@log_data.paths[path])} user per view"
    end

    def avg(path)
      path.visits / path.users
    end
  end
end
