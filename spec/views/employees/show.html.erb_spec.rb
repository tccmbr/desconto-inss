# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/show', type: :view do
  before do
    assign(:employee, Employee.create!(
                        name: 'Name',
                        document_number: 'Document Number',
                        salary: '9.99',
                        inss_discount: '9.99'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Document Number/)
    expect(rendered).to match(/9.99/)
  end
end
