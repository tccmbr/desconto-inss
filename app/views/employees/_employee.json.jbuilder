# frozen_string_literal: true

json.extract! employee, :id, :name, :document_number, :birthday, :salary, :inss_discount, :created_at, :updated_at
json.url employee_url(employee, format: :json)
