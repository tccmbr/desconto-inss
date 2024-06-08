# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

FactoryBot.create(:inss_contribution_salary_range, salary_range_number: 1,
                                                   start_salary_range: 0,
                                                   end_salary_range: 1045.00,
                                                   aliquot: 7.5)

FactoryBot.create(:inss_contribution_salary_range, salary_range_number: 2,
                                                   start_salary_range: 1045.01,
                                                   end_salary_range: 2089.60,
                                                   aliquot: 9.0)

FactoryBot.create(:inss_contribution_salary_range, salary_range_number: 3,
                                                   start_salary_range: 2089.61,
                                                   end_salary_range: 3134.40,
                                                   aliquot: 12.0)

FactoryBot.create(:inss_contribution_salary_range, salary_range_number: 4,
                                                   start_salary_range: 3134.41,
                                                   end_salary_range: 6101.06,
                                                   aliquot: 14.0)

employees = FactoryBot.build_list(:employee, 30, :completed, contacts: FactoryBot.build_list(:contact, 2))

employees.each do |employee|
  operation = Inss::Operation::CalculateDiscount.call(params: { salary: employee.salary })

  employee.inss_discount = operation[:result] if operation.success?
  employee.save
end
