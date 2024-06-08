# frozen_string_literal: true

class Employee::SalaryUpdateJob < ApplicationJob
  queue_as :default

  def perform(**args)
    employee = args[:employee]
    salary = args[:salary]

    employee.salary = salary
    operation = Inss::Operation::CalculateDiscount.call(params: { salary: })
    employee.inss_discount = operation[:result] if operation.success?
    employee.save
  rescue StandardError => _e
    # Send notification to observability tool
  end
end
