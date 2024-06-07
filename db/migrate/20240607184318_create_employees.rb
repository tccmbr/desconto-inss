# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :document_number
      t.date :birthday
      t.decimal :salary
      t.decimal :inss_discount

      t.timestamps
    end
  end
end
