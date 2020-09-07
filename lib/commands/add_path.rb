# frozen_string_literal: true

require './lib/repositories/path_info'

module Commands
  # Commands::AddPath class
  #
  # Adds path info to repository, calculate metrics
  class AddPath
    def call(repository, path, ip)
      path_info = repository.paths[path] || Repositories::PathInfo.new
      repository.paths[path] = update_metrics path_info, ip
    end

    private

    def update_metrics(path_info, ip)
      path_info.visits += 1
      unless path_info.ips.include?(ip)
        path_info.users += 1
        path_info.ips << ip
      end
      path_info
    end
  end
end
