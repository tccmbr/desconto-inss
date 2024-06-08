# frozen_string_literal: true

class Inss::CalculatorsController < ApplicationController
  def calculate_discount
    operation = Inss::Operation::CalculateDiscount.call(params: { salary: calculate_discount_params[:salary] })

    return render json: { discount: operation[:result] }, status: :ok if operation.success?

    render json: {}, status: :unprocessable_entity
  end

  private

  def calculate_discount_params
    params.permit(:salary)
  end
end
