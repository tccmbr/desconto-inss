# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject(:employee) { build(:employee, :completed, contacts: [build(:contact)]) }

  describe '#save' do
    before do
      employee.save
    end

    it do
      expect(employee).to be_persisted
    end
  end
end
