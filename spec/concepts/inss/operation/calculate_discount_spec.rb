# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inss::Operation::CalculateDiscount, type: :operation do
  subject(:operation) { described_class.wtf?(params:) }

  let(:inss_contribution_salary_ranges) do
    create(:inss_contribution_salary_range, salary_range_number: 1,
                                            start_salary_range: 0,
                                            end_salary_range: 1045.00,
                                            aliquot: 7.5)

    create(:inss_contribution_salary_range, salary_range_number: 2,
                                            start_salary_range: 1045.01,
                                            end_salary_range: 2089.60,
                                            aliquot: 9.0)

    create(:inss_contribution_salary_range, salary_range_number: 3,
                                            start_salary_range: 2089.61,
                                            end_salary_range: 3134.40,
                                            aliquot: 12.0)

    create(:inss_contribution_salary_range, salary_range_number: 4,
                                            start_salary_range: 3134.41,
                                            end_salary_range: 6101.06,
                                            aliquot: 14.0)
  end
  let(:params) do
    {
      salary:
    }
  end

  before do
    inss_contribution_salary_ranges
  end

  describe '.call' do
    context 'when salary is zero or empty' do
      let(:salary) { '' }

      it 'must return discount of R$ 78,37' do
        expect(operation).not_to be_success
        expect(operation[:errors]).to eq(['Salário é obrigatório!'])
      end
    end

    context 'when salary is R$ 1.045,00' do
      let(:salary) { 1045.00 }

      it 'must return discount of R$ 78,37' do
        expect(operation).to be_success
        expect(operation[:result]).to eq(78.37)
      end
    end

    context 'when salary is R$ 2.500,00' do
      let(:salary) { 2500.00 }

      it 'must return discount of R$ 221,62' do
        expect(operation).to be_success
        expect(operation[:result].to_f).to eq(221.62)
      end
    end

    context 'when salary is R$ 3.000,00' do
      let(:salary) { 3000.00 }

      it 'must return discount of R$ 281,62' do
        expect(operation).to be_success
        expect(operation[:result]).to eq(281.62)
      end
    end

    context 'when salary is R$ 4.000,00' do
      let(:salary) { 4000.00 }

      it 'must return discount of R$ 418,93' do
        expect(operation).to be_success
        expect(operation[:result].to_f).to eq(418.93)
      end
    end
  end
end
