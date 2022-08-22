module AsyncProcesses
  require 'open-uri'

  class ProcessFiles
    attr_accessor :files, :xmls

    def initialize(files)
      @files = files
      @xmls = convert_xml_to_hash
    end

    def import
      ImportFiles.new(xmls).call
    end

    def convert_xml_to_hash
      files.compact_blank.map do |file|
        Hash.from_xml(URI.open(file).read)
      end
    end
  end
end
