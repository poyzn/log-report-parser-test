# frozen_string_literal: true

require 'test_helper'

describe Commands::ParseFile do
  let(:file) { file_path }
  it 'parses file into LogData object' do
    expect(described_class.new(file).call).to be_an_instance_of Repositories::LogData
  end
end
