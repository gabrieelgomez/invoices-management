class BulkUploadJob < ApplicationJob
  queue_as :default

  def perform(files)
    ::BulkUploads::ImportFiles.new(files).call
  end
end
