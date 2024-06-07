# frozen_string_literal: true

class Inss::ContributionSalaryRangesController < ApplicationController
  before_action :set_inss_contribution_salary_range, only: %i[show edit update destroy]

  # GET /inss/contribution_salary_ranges or /inss/contribution_salary_ranges.json
  def index
    @inss_contribution_salary_ranges = Inss::ContributionSalaryRange.all
  end

  # GET /inss/contribution_salary_ranges/1 or /inss/contribution_salary_ranges/1.json
  def show; end

  # GET /inss/contribution_salary_ranges/new
  def new
    @inss_contribution_salary_range = Inss::ContributionSalaryRange.new
  end

  # GET /inss/contribution_salary_ranges/1/edit
  def edit; end

  # POST /inss/contribution_salary_ranges or /inss/contribution_salary_ranges.json
  def create
    @inss_contribution_salary_range = Inss::ContributionSalaryRange.new(inss_contribution_salary_range_params)

    respond_to do |format|
      if @inss_contribution_salary_range.save
        format.html do
          redirect_to inss_contribution_salary_range_url(@inss_contribution_salary_range),
                      notice: 'Contribution salary range was successfully created.'
        end
        format.json { render :show, status: :created, location: @inss_contribution_salary_range }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inss_contribution_salary_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inss/contribution_salary_ranges/1 or /inss/contribution_salary_ranges/1.json
  def update
    respond_to do |format|
      if @inss_contribution_salary_range.update(inss_contribution_salary_range_params)
        format.html do
          redirect_to inss_contribution_salary_range_url(@inss_contribution_salary_range),
                      notice: 'Contribution salary range was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @inss_contribution_salary_range }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inss_contribution_salary_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inss/contribution_salary_ranges/1 or /inss/contribution_salary_ranges/1.json
  def destroy
    @inss_contribution_salary_range.destroy!

    respond_to do |format|
      format.html do
        redirect_to inss_contribution_salary_ranges_url, notice: 'Contribution salary range was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inss_contribution_salary_range
    @inss_contribution_salary_range = Inss::ContributionSalaryRange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inss_contribution_salary_range_params
    params.require(:inss_contribution_salary_range).permit(:salary_range_number, :start_salary_range,
                                                           :end_salary_range, :aliquot)
  end
end
