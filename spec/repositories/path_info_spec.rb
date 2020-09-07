# frozen_string_literal: true

require 'test_helper'

describe Repositories::PathInfo do
  before(:each) do
    subject { described_class.new }
  end
  it 'initialize empty path info repo object' do
    expect(subject.visits).to be_zero
    expect(subject.users).to be_zero
    expect(subject.ips).to eq []
  end
  it 'allows update visits' do
    subject.visits += 1
    expect(subject.visits).to eq 1
  end
  it 'allows update users' do
    subject.users += 1
    expect(subject.users).to eq 1
  end
  it 'allows update ips' do
    subject.ips << '8.8.8.8'
    expect(subject.ips).to eq ['8.8.8.8']
  end
end
