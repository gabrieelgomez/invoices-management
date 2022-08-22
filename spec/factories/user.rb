FactoryBot.define do
  factory :user do
    name { FFaker::NameMX.full_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    rfc { FFaker::IdentificationMX.rfc_persona_moral }
    type { User::TYPES.sample }
  end

  trait :emitter do
    type { :Emitter }
  end

  trait :receiver do
    type { :Receiver }
  end
end
