# frozen_string_literal: true

require 'test_helper'

describe Validators::PathValidator do
  context 'valid path' do
    %w[/ /test /test/ /test/1 /test_test /test_test/ /test-test /test-test/].each do |path|
      it "returns true for #{path}" do
        expect(described_class.valid?(path)).to be_truthy
      end
    end
  end
  context 'invalid path' do
    ['', 'test~'].each do |path|
      it "returns false for #{path}" do
        expect(described_class.valid?(path)).to be_falsey
      end
    end
  end
end
