# frozen_string_literal: true

require 'test_helper'

describe Parser do
  context 'fails to run' do
    it 'raises error without argument' do
      expect { described_class.new }.to raise_exception ArgumentError
    end
    it 'initializes parser' do
      expect(described_class.new(nil)).to be_an_instance_of(Parser)
    end
    it 'fails to run without file' do
      error = Presenters::ErrorMessagePresenter.call Errors::ArgumentMissing.new.message
      expect do
        described_class.new(nil).run
      end.to output("#{error}\n").to_stdout
    end
    it 'fails to run without non existed file' do
      error = Presenters::ErrorMessagePresenter.call Errors::FileNotFound.new.message
      expect do
        described_class.new('non-existed.log').run
      end.to output("#{error}\n").to_stdout
    end
  end

  context 'runs successfully' do
    let(:file) { file_path }

    it 'outputs metrics' do
      report = ['-=Visits=-',
                '/contact 4 visits',
                '/help_page/1 2 visits',
                '-=Users=-',
                '/contact 3 unique views',
                "/help_page/1 2 unique views\n"].join("\n")
      expect { Parser.new(file).run }.to output(report).to_stdout
    end
  end
end
