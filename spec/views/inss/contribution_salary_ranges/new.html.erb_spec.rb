# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inss/contribution_salary_ranges/new', type: :view do
  before do
    assign(:inss_contribution_salary_range, Inss::ContributionSalaryRange.new(
                                              salary_range_number: 1,
                                              start_salary_range: '9.99',
                                              end_salary_range: '9.99',
                                              aliquot: '9.99'
                                            ))
  end

  it 'renders new inss_contribution_salary_range form' do
    render

    assert_select 'form[action=?][method=?]', inss_contribution_salary_ranges_path, 'post' do
      assert_select 'input[name=?]', 'inss_contribution_salary_range[salary_range_number]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[start_salary_range]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[end_salary_range]'

      assert_select 'input[name=?]', 'inss_contribution_salary_range[aliquot]'
    end
  end
end
