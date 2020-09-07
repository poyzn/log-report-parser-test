# frozen_string_literal: true

require 'test_helper'

describe Repositories::LogData  do
  subject { described_class.new }

  it 'initialize empty paths hash' do
    expect(subject.paths).to eq({})
  end
end
