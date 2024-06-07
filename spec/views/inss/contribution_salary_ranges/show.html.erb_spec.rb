# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inss/contribution_salary_ranges/show', type: :view do
  before do
    assign(:inss_contribution_salary_range, Inss::ContributionSalaryRange.create!(
                                              salary_range_number: 2,
                                              start_salary_range: '9.99',
                                              end_salary_range: '9.99',
                                              aliquot: '9.99'
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
