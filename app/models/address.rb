# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :zip_code, presence: true, length: { minimum: 8 }
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
