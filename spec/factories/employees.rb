# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { 'MyString' }
    document_number { 'MyString' }
    birthday { '2024-06-07' }
    salary { '9.99' }
    inss_discount { '9.99' }
  end
end
