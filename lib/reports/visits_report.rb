# frozen_string_literal: true

require './lib/reports/base_report'

module Reports
  # Reports::VisitsReport class
  #
  # Generate a report by visits
  class VisitsReport < BaseReport
    private

    def title
      "Visits\n"
    end

    # Sorts paths stored in repository in reverse order
    def sorted_paths
      @log_data.paths.sort_by { |_path, info| info.visits }.reverse
    end

    # Decorates a report line
    def decorated_path(path)
      "#{path} #{@log_data.paths[path].visits} visits"
    end
  end
end
