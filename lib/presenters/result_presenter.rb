# frozen_string_literal: true

module Presenters
  # Presenters::RedultPresenter
  #
  # Builds report presentation
  class ResultPresenter
    # Initializes result presenter
    # Params:
    # +log_data+ - instance of Repository::LogData
    def initialize(log_data)
      @log_data = log_data
    end

    # Builds presentation accoirding with passed property
    # Params:
    # +propery+ - property of Repository::PathInfo instance,
    # can be visits or users
    def show(property)
      @property = property
      [decorated_title(title),
       sorted_paths.map { |path, _val| decorated_path(path) }.join("\n")].join
    end

    private

    # Sorts paths stored in repository in reverse order
    def sorted_paths
      @log_data.paths.sort_by { |_path, info| info.send(@property) }.reverse
    end

    # Resolves a title for the report
    def title
      @property == :visits ? 'Visits' : 'Users'
    end

    # Decorates a title
    def decorated_title(title)
      "-=#{title}=-\n"
    end

    # Decorates a report line
    def decorated_path(path)
      if @property == :visits
        "#{path} #{@log_data.paths[path].visits} visits"
      else
        "#{path} #{@log_data.paths[path].users} unique views"
      end
    end
  end
end
