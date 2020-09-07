# frozen_string_literal: true

require 'test_helper'

describe Commands::AddPath do
  let(:log_data) { Repositories::LogData.new }
  let(:path) { '/test' }
  let(:ip) { '8.8.8.8' }

  context 'single path' do
    it 'adds path to log data' do
      described_class.new.call log_data, path, ip
      expect(log_data.paths.count).to eq 1
      expect(log_data.paths[path].visits).to eq 1
      expect(log_data.paths[path].users).to eq 1
      expect(log_data.paths[path].ips).to eq [ip]
    end

    it 'increments path views with same ip' do
      2.times do
        described_class.new.call log_data, path, ip
      end
      expect(log_data.paths.count).to eq 1
      expect(log_data.paths[path].visits).to eq 2
      expect(log_data.paths[path].users).to eq 1
      expect(log_data.paths[path].ips).to eq [ip]
    end
  end

  context 'multiple paths' do
    let(:another_path) { '/test/1' }
    let(:another_ip) { '1.1.1.1' }

    it 'increments path users with different ip' do
      2.times do
        described_class.new.call log_data, path, ip
      end
      described_class.new.call log_data, path, another_path
      expect(log_data.paths.count).to eq 1
      expect(log_data.paths[path].visits).to eq 3
      expect(log_data.paths[path].users).to eq 2
      expect(log_data.paths[path].ips).to eq [ip, another_path]
    end

    it 'adds another path' do
      described_class.new.call log_data, path, ip
      3.times do
        described_class.new.call log_data, another_path, ip
      end
      expect(log_data.paths.count).to eq 2
      expect(log_data.paths[another_path].visits).to eq 3
      expect(log_data.paths[another_path].users).to eq 1
      expect(log_data.paths[another_path].ips).to eq [ip]
    end
  end
end
