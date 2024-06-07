# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inss/contribution_salary_ranges/edit', type: :view do
  let(:inss_contribution_salary_range) do
    Inss::ContributionSalaryRange.create!(
      salary_range_number: 1,
      start_salary_range: '9.99',
      end_salary_range: '9.99',
      aliquot: '9.99'
    )
  end

  before do
    assign(:inss_contribution_salary_range, inss_contribution_salary_range)
  end

  it 'renders the edit inss_contribution_salary_range form' do
    render

    assert_select 'form[action=?][method=?]', inss_contribution_salary_range_path(inss_contribution_salary_range),
                  'post' do
      assert_select 'input[name=?]', 'inss_contribution_salary_range[salary_range_number]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[start_salary_range]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[end_salary_range]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[aliquot]'
    end
  end
end
