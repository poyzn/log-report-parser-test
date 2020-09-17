# frozen_string_literal: true

require './lib/reports/base_report'

module Reports
  # Reports::UsersReport class
  #
  # Generate a report by users
  class UsersReport < BaseReport
    private

    def title
      "Users\n"
    end

    # Sorts paths stored in repository in reverse order
    def sorted_paths
      @log_data.paths.sort_by { |_path, info| info.users }.reverse
    end

    # Decorates a report line
    def decorated_path(path)
      "#{path} #{@log_data.paths[path].users} unique views"
    end
  end
end
