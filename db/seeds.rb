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
end
