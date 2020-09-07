# frozen_string_literal: true

require_relative '../validators/log_record_validator'
require_relative '../repositories/log_data'
require_relative '../commands/parse_log_line'
require_relative '../commands/add_path'

module Commands
  # Commands::ParseFile class
  #
  # Parses file from filepath and stores data info repository
  class ParseFile
    include Validators
    include Repositories

    def initialize(filepath)
      @filepath = filepath
    end

    def call
      File.read(@filepath).each_line do |record|
        path, ip = ParseLogLine.call record.chomp
        AddPath.new.call(log, path, ip) if LogRecordValidator.valid?(path, ip)
      end
      log
    end

    def log
      @log ||= LogData.new
    end
  end
end
