# frozen_string_literal: true

module FixtureHelpers
  def file_path
    fixture_dir 'file.log'
  end

  def fixture_dir(filename)
    File.join __dir__, '..', 'fixtures', filename
  end
end
