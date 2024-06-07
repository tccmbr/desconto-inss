# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    kind_cd { Contact::KINDS.sample }
    value { Faker::PhoneNumber.phone_number }
  end
end
