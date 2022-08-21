module BulkUploads
  class ProcessFiles
    attr_accessor :files, :xmls

    def initialize(files)
      @files = files
      @xmls = convert_xml_to_hash
    end

    def import
      BulkUploadJob.perform_later xmls
    end

    def convert_xml_to_hash
      files.compact_blank.map do |file|
        Hash.from_xml(File.open(file).read)
      end
    end
  end
end
