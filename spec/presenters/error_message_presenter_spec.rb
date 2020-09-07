# frozen_string_literal: true

require 'test_helper'

describe Presenters::ErrorMessagePresenter do
  it 'decorates an error message' do
    message = 'Hello world'
    expect(described_class.call(message)).to eq "Program stopped with error: #{message}"
  end
end
