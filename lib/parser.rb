# frozen_string_literal: true

require './lib/errors/file_not_found'
require './lib/errors/argument_missing'
require './lib/commands/parse_file'
require './lib/presenters/result_presenter'
require './lib/presenters/error_message_presenter'

# Parse class
#
# Main app class
class Parser
  include Errors
  include Commands
  include Presenters

  def initialize(args)
    @args = Array(args).compact
  end

  def run
    raise ArgumentMissing unless @args.any?
    raise FileNotFound unless File.file?(@args[0]) && File.exist?(@args[0])

    presenter = ResultPresenter.new(ParseFile.new(@args[0]).call)
    puts presenter.show :visits
    puts presenter.show :users
  rescue ParserError => e
    puts ErrorMessagePresenter.call(e.message)
  end
end
