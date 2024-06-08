# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Employee::SalaryUpdateJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later(employee:, salary:) }

  let(:employee) { build(:employee, :completed, contacts: []) }
  let(:salary) { 1045.00 }

  before do
    employee.save
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with({ employee:, salary: })
      .on_queue('default')
  end
end
