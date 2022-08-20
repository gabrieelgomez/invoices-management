class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.text :invoice_uuid
      t.integer :status, default: 0
      t.integer :emitter_id
      t.integer :receiver_id
      t.float :amount, default: 0
      t.string :currency
      t.date :emitted_at
      t.date :expires_at
      t.date :signed_at
      t.text :cfdi_digital_stamp

      t.timestamps
    end
  end
end
