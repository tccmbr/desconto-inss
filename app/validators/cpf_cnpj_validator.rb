# frozen_string_literal: true

class CpfCnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if CPF.valid?(value) || CNPJ.valid?(value)

    default_message = I18n.t('errors.messages.invalid')
    record.errors.add attribute, (options[:message] || default_message)
  end
end
