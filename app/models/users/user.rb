# frozen_string_literal: true

class User < ApplicationRecord
  TYPES = %i[Emitter Receiver].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :type, :rfc, :name, presence: true
  validates :type, inclusion: { in: TYPES }
end
