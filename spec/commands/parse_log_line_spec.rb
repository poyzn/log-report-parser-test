# frozen_string_literal: true

require 'test_helper'

describe Commands::ParseLogLine do
  it 'splits log line' do
    line = '/path 8.8.8.8'
    expect(described_class.call(line)).to eq %w[/path 8.8.8.8]
  end
end
