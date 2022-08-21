# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create(
    name: FFaker::NameMX.full_name,
    email: FFaker::Internet.email,
    password: FFaker::Internet.password,
    rfc: FFaker::IdentificationMX.rfc_persona_moral,
    type: User::TYPES.sample
  )

  puts user.email
  puts user.valid?
end

15.times do
  Invoice.create(
    invoice_uuid: SecureRandom.uuid,
    status: :active,
    emitter: Emitter.all.sample,
    receiver: Receiver.all.sample,
    amount: FFaker::Number.number,
    currency: FFaker::Currency.code,
    emitted_at: FFaker::Time.date,
    expires_at: FFaker::Time.date,
    signed_at: FFaker::Time.date,
    cfdi_digital_stamp: FFaker::DizzleIpsum.characters
  )
end
