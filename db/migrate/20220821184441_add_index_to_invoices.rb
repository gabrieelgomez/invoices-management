class AddIndexToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_index :invoices, %i[invoice_uuid cfdi_digital_stamp], unique: true
  end
end
