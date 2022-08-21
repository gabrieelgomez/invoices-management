module BulkUploads
  class ParseFiles
    attr_accessor :params, :xmls

    def initialize(params)
      @params = params
      @xmls = convert_to_xml
    end

    def call
      BulkUploadJob.perform_later xmls
    end

    def convert_to_xml
      params.dig(:bulk_upload, :files).compact_blank.map do |file|
        file.open
        Hash.from_xml(file.read)
      end
    end
  end
end
