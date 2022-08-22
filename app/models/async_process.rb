class AsyncProcess < ApplicationRecord
  has_many_attached :files

  def blob_url_path
    Attachments::Storage.new(files).paths
  end
end
