# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'MyString' }
    kind_cd { 'MyString' }
    value { 'MyString' }
    owner { nil }
  end
end
