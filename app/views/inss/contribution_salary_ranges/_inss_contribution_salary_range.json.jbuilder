# frozen_string_literal: true

json.extract! inss_contribution_salary_range, :id, :salary_range_number, :start_salary_range, :end_salary_range,
              :aliquot, :created_at, :updated_at
json.url inss_contribution_salary_range_url(inss_contribution_salary_range, format: :json)
