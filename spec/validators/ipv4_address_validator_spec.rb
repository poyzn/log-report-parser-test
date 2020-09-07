# frozen_string_literal: true

require 'test_helper'

describe Validators::Ipv4AddressValidator do
  include FixtureHelpers

  context 'valid address' do
    %w[0.0.0.0 1.1.1.1 192.0.0.1 123.123.123.123].each do |path|
      it "returns true for #{path}" do
        expect(described_class.valid?(path)).to be_truthy
      end
    end
  end

  context 'invalid address' do
    %w[0.0.0 123.123.123.123.123].each do |path|
      it "returns false for #{path}" do
        expect(described_class.valid?(path)).to be_falsey
      end
    end
  end
end
