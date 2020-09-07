# frozen_string_literal: true

require 'test_helper'

describe Validators::LogRecordValidator do
  context 'valid log record' do
    it 'validates record' do
      expect(described_class.valid?('/', '1.1.1.1')).to be_truthy
    end
  end
  context 'invalid log record' do
    it 'fails to validate record' do
      expect(described_class.valid?('/', '1.1.1')).to be_falsey
      expect(described_class.valid?('', '1.1.1.1')).to be_falsey
    end
  end
end
