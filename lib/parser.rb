# frozen_string_literal: true

require './lib/errors/file_not_found'
require './lib/errors/argument_missing'
require './lib/commands/parse_file'
require './lib/presenters/error_message_presenter'
require './lib/reports/visits_report'
require './lib/reports/users_report'
require './lib/reports/average_report'

# Parse class
#
# Main app class
class Parser
  include Errors
  include Reports
  include Commands
  include Presenters

  def initialize(args)
    @args = Array(args).compact
  end

  def run
    raise ArgumentMissing unless @args.any?
    raise FileNotFound unless File.file?(@args[0]) && File.exist?(@args[0])

    log = ParseFile.new(@args[0]).call
    puts VisitsReport.new(log)
    puts UsersReport.new(log)
    puts AverageReport.new(log)
  rescue ParserError => e
    puts ErrorMessagePresenter.call(e.message)
  end
end
