# frozen_string_literal: true

module Reports
  # Reports::BaseReport class
  #
  # Common class for report subclasses
  class BaseReport
    # Initializes result presenter
    # Params:
    # +log_data+ - instance of Repository::LogData
    def initialize(log_data)
      @log_data = log_data
    end

    def to_s
      [title,
       sorted_paths.map { |path, _val| decorated_path(path) }.join("\n")].join
    end

    private

    def title
      raise 'Should be implemented'
    end

    def sorted_paths
      raise 'Should be implemented'
    end

    def decorated_path
      raise 'Should be implemented'
    end
  end
end
