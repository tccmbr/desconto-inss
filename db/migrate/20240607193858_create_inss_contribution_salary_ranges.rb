# frozen_string_literal: true

class CreateInssContributionSalaryRanges < ActiveRecord::Migration[7.1]
  def change
    create_table :inss_contribution_salary_ranges do |t|
      t.integer :salary_range_number
      t.decimal :start_salary_range
      t.decimal :end_salary_range
      t.decimal :aliquot

      t.timestamps
    end
  end
end
