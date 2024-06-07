# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/new', type: :view do
  before do
    assign(:employee, Employee.new(
                        name: 'MyString',
                        document_number: 'MyString',
                        salary: '9.99',
                        inss_discount: '9.99'
                      ))
  end

  it 'renders new employee form' do
    render

    assert_select 'form[action=?][method=?]', employees_path, 'post' do
      assert_select 'input[name=?]', 'employee[name]'

      assert_select 'input[name=?]', 'employee[document_number]'

      assert_select 'input[name=?]', 'employee[salary]'

      assert_select 'input[name=?]', 'employee[inss_discount]'
    end
  end
end
