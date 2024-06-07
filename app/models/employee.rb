# frozen_string_literal: true

class Employee < ApplicationRecord
  acts_as_paranoid

  has_one :address, as: :owner, dependent: :destroy
  has_many :contacts, as: :owner, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true
end
