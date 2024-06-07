# frozen_string_literal: true

class Address < ApplicationRecord
  acts_as_paranoid

  belongs_to :owner, polymorphic: true
end
