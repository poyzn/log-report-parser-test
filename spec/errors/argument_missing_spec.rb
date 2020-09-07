# frozen_string_literal: true

require 'test_helper'

describe Errors::ArgumentMissing do
  it 'raises argument missing error' do
    expect { raise described_class }.to raise_exception(Errors::ArgumentMissing)
  end
end
