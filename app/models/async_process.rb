class AsyncProcess < ApplicationRecord
  has_many_attached :files

  def blob_url_path
    files.map do |file|
      ActiveStorage::Blob.service.path_for file.key
    end
  end
end
