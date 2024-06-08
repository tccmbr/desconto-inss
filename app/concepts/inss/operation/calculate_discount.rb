# frozen_string_literal: true

module Inss::Operation
  class CalculateDiscount < Trailblazer::Operation
    step :validate, fail_fast: true
    step :find_contribuition_salary_range
    step :process

    def validate(ctx, params:)
      errors = []
      errors << 'Salário é obrigatório!' if params[:salary].blank?
      ctx[:errors] = errors
      errors.blank?
    end

    def find_contribuition_salary_range(ctx, **)
      salary_ranges = Inss::ContributionSalaryRange.all.order(salary_range_number: :ASC)
      ctx[:salary_ranges] = salary_ranges
    end

    def process(ctx, params:, salary_ranges:, **) # rubocop:disable Metrics/AbcSize
      salary = params[:salary].to_d
      result = { discount: 0 }

      salary_ranges.reduce({ discount: 0, last_range: nil, finished: false }) do |acc, current|
        base_value = salary >= current.end_salary_range ? current.end_salary_range : salary

        result = if acc[:discount].present? && acc[:last_range].present?
                   {
                     discount: discount(acc[:last_range].end_salary_range, current.aliquot, base_value, acc[:discount]),
                     last_range: current
                   }
                 else
                   { discount: discount(current.end_salary_range, current.aliquot), last_range: current }
                 end

        break if salary_range_reached?(base_value, salary)

        result
      end

      ctx[:result] = result[:discount]
    end

    private

    def salary_range_reached?(base, salary)
      base == salary
    end

    def discount(end_salary_range, aliquot, base_value = 0, last_discount = 0)
      aliquot /= 100

      total = base_value.positive? ? base_value - end_salary_range : end_salary_range

      (last_discount + (total * aliquot)).floor(2)
    end
  end
end
