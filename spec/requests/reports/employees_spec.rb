# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reports::Employees', type: :request do
  describe 'GET /contribution_salary_range' do
    it 'returns http success' do
      get '/reports/employees/contribution_salary_range'
      expect(response).to have_http_status(:success)
    end
  end
end
