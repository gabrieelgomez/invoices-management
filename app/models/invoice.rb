# frozen_string_literal: true

class Invoice < ApplicationRecord
  UNIQUE_COLUMS = %i[invoice_uuid cfdi_digital_stamp].freeze

  belongs_to :emitter, class_name: 'Emitter'
  belongs_to :receiver, class_name: 'Receiver'

  enum status: %i[inactive active]

  validates :invoice_uuid, :cfdi_digital_stamp, presence: true
  validates :invoice_uuid, :cfdi_digital_stamp, uniqueness: true

  ransacker :status, formatter: proc { |v| statuses[v] }
end
