# frozen_string_literal: true

require 'test_helper'

describe Reports::AverageReport do
  subject { described_class.new(Commands::ParseFile.new(file_path).call) }
  it 'creates an instance' do
    expect(subject).to be_kind_of Reports::AverageReport
  end
  it 'response to to_s' do
    expect(subject).to respond_to :to_s
  end
  it 'generates report' do
    output = [
      'Average',
      '/contact 1 user per view',
      '/help_page/1 1 user per view'
    ].join "\n"
    expect(subject.to_s).to eq output
  end
end
