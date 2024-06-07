# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { build(:address, owner:) }

  let(:owner) { create(:employee) }

  describe '#save' do
    before do
      address.save
    end

    it do
      expect(address).to be_persisted
    end
  end
end
