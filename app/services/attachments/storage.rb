module Attachments
  class Storage
    attr_accessor :files

    SERVICES = {
      amazon: proc { |file| file.url },
      local: proc { |file| ActiveStorage::Blob.service.path_for file.key }
    }.freeze

    def initialize(files)
      @files = files
    end

    def paths
      files.map { |file| url_for(file:) }
    end

    private

    def url_for(file:)
      SERVICES[file.blob.service.name].call(file)
    end
  end
end
