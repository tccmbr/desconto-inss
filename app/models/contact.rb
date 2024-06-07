# frozen_string_literal: true

class Contact < ApplicationRecord
  KINDS = %w[email phone].freeze

  belongs_to :owner, polymorphic: true

  as_enum :kind, KINDS, map: :string
end
