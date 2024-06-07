# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    document_number { CPF.generate }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    salary { Faker::Number.decimal(l_digits: 2) }
    inss_discount { Faker::Number.decimal(l_digits: 2) }

    trait :completed do
      association :address, factory: :address
      association :contacts, factory: :contact
    end
  end
end
