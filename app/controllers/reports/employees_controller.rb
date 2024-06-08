# frozen_string_literal: true

class Reports::EmployeesController < ApplicationController
  ActionController::Base.helpers

  def contribution_salary_range # rubocop:disable Metrics/AbcSize
    contribution_salary_ranges = Inss::ContributionSalaryRange.all.order(salary_range_number: :ASC)

    result = contribution_salary_ranges.map do |salary_range|
      total = Employee.where(Employee.arel_table[:salary].lteq(salary_range.end_salary_range))
                      .where(Employee.arel_table[:salary].gteq(salary_range.start_salary_range)).count
      {
        value: total,
        label: "Entre #{money_format(salary_range.start_salary_range)} e #{money_format(salary_range.end_salary_range)}"
      }
    end

    render json: result, status: :ok
  end

  private

  def money_format(value)
    ActionController::Base.helpers.humanized_money_with_symbol value
  end
end
