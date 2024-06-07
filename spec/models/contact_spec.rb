# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { build(:contact, owner:) }

  let(:owner) { create(:employee) }

  describe '#save' do
    before do
      contact.save
    end

    it do
      expect(contact).to be_persisted
    end
  end
end
