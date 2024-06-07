# frozen_string_literal: true

FactoryBot.define do
  factory :inss_contribution_salary_range, class: 'Inss::ContributionSalaryRange' do
    salary_range_number { 1 }
    start_salary_range { '9.99' }
    end_salary_range { '9.99' }
    aliquot { '9.99' }
  end
end
