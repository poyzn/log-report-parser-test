# frozen_string_literal: true

require 'test_helper'

describe Reports::VisitsReport do
  subject { described_class.new(Commands::ParseFile.new(file_path).call) }
  it 'creates an instance' do
    expect(subject).to be_kind_of Reports::VisitsReport
  end
  it 'response to to_s' do
    expect(subject).to respond_to :to_s
  end
  it 'generates report' do
    output = [
      'Visits',
      '/contact 4 visits',
      '/help_page/1 2 visits'
    ].join "\n"
    expect(subject.to_s).to eq output
  end
end
