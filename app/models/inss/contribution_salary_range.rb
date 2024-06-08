# frozen_string_literal: true

class Inss::ContributionSalaryRange < ApplicationRecord
  validates :salary_range_number, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :start_salary_range, numericality: { greater_than_or_equal_to: 0 }
  validates :end_salary_range, numericality: { greater_than: 0 }
  validates :aliquot, numericality: { greater_than: 0 }
end
