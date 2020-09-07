# frozen_string_literal: true

require 'test_helper'

describe Errors::FileNotFound do
  it 'raises file not found error' do
    expect { raise described_class }.to raise_exception(Errors::FileNotFound)
  end
end
