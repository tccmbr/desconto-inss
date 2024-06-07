# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inss/contribution_salary_ranges/index', type: :view do
  before do
    assign(:inss_contribution_salary_ranges, [
             Inss::ContributionSalaryRange.create!(
               salary_range_number: 2,
               start_salary_range: '9.99',
               end_salary_range: '9.99',
               aliquot: '9.99'
             ),
             Inss::ContributionSalaryRange.create!(
               salary_range_number: 2,
               start_salary_range: '9.99',
               end_salary_range: '9.99',
               aliquot: '9.99'
             )
           ])
  end

  it 'renders a list of inss/contribution_salary_ranges' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
