# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/index', type: :view do
  before do
    assign(:employees, [
             Employee.create!(
               name: 'Name',
               document_number: 'Document Number',
               salary: '9.99',
               inss_discount: '9.99'
             ),
             Employee.create!(
               name: 'Name',
               document_number: 'Document Number',
               salary: '9.99',
               inss_discount: '9.99'
             )
           ])
  end

  it 'renders a list of employees' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Document Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
