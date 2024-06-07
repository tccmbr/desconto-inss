# frozen_string_literal: true

json.array! @inss_contribution_salary_ranges,
            partial: 'inss/contribution_salary_ranges/inss_contribution_salary_range', as: :inss_contribution_salary_range # rubocop:disable Layout/LineLength
