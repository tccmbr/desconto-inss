# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.references :owner, polymorphic: true, null: false, type: :uuid

      t.timestamps
      t.datetime :deleted_at, index: true
    end
  end
end
