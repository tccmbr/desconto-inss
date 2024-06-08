# frozen_string_literal: true

class Employee < ApplicationRecord
  acts_as_paranoid

  monetize as: :salary
  monetize as: :inss_discount

  has_one :address, as: :owner, dependent: :destroy
  has_many :contacts, as: :owner, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: lambda { |attributes|
                                                                             attributes['name'].blank?
                                                                           }

  validates :document_number, cpf_cnpj: true
end
