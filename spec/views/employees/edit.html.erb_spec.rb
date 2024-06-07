# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/edit', type: :view do
  let(:employee) do
    Employee.create!(
      name: 'MyString',
      document_number: 'MyString',
      salary: '9.99',
      inss_discount: '9.99'
    )
  end

  before do
    assign(:employee, employee)
  end

  it 'renders the edit employee form' do
    render

    assert_select 'form[action=?][method=?]', employee_path(employee), 'post' do
      assert_select 'input[name=?]', 'employee[name]'
      assert_select 'input[name=?]', 'employee[document_number]'
      assert_select 'input[name=?]', 'employee[salary]'
      assert_select 'input[name=?]', 'employee[inss_discount]'
    end
  end
end
