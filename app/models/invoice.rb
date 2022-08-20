# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :emitter, class_name: 'Emitter'
  belongs_to :receiver, class_name: 'Receiver'

  enum status: %i[inactive active]
end
