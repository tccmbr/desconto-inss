# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :owner, polymorphic: true

  as_enum :kind, %i[email phone], map: :string
end
