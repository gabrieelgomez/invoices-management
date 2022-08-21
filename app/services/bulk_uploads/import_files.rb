module BulkUploads
  class ImportFiles
    attr_accessor :xmls, :invoices

    COLUMNS = %i[invoice_uuid
                 status
                 emitter_id
                 receiver_id
                 amount
                 currency
                 emitted_at
                 expires_at
                 signed_at
                 cfdi_digital_stamp].freeze

    def initialize(xmls)
      @xmls = xmls.map { |xml| OpenStruct.new xml['hash'] }
      @invoices = convert_xmls_to_invoice_attributes
    end

    def call
      Invoice.upsert_all(invoices, update_only: COLUMNS)
      # Invoice.import(COLUMNS, invoices)
    end

    private

    def convert_xmls_to_invoice_attributes
      xmls.map do |xml|
        {
          invoice_uuid: xml.invoice_uuid,
          status: xml.status,
          emitter_id: emitter(xml.emitter).id,
          receiver_id: receiver(xml.receiver).id,
          amount: xml.amount['cents'],
          currency: xml.amount['currency'],
          emitted_at: xml.emitted_at,
          expires_at: xml.expires_at,
          signed_at: xml.signed_at,
          cfdi_digital_stamp: xml.cfdi_digital_stamp
        }
      end
    end

    def emitter(user)
      UserService.new(user:, type: :Emitter).call
    end

    def receiver(user)
      UserService.new(user:, type: :Receiver).call
    end
  end
end