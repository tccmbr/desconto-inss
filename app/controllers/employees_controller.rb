# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  # GET /employees or /employees.json
  def index
    @employees = Employee.order(:name).page(search_params[:page]).per(5)
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_address
    @employee.contacts.build
    @employee.contacts.build
    @employee.contacts.build
  end

  # GET /employees/1/edit
  def edit
    @employee.contacts.build
    @employee.contacts.build
    @employee.contacts.build
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: I18n.t(:saved_sucessfully) }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update # rubocop:disable Metrics/AbcSize
    Employee::SalaryUpdateJob.perform_later(employee: @employee, salary: employee_params[:salary])

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: I18n.t(:edited_sucessfully) }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: I18n.t(:deleted_sucessfully) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :document_number, :birthday, :salary, :inss_discount,
                                     contacts_attributes: %i[id name kind value],
                                     address_attributes: %i[id zip_code street number complement neighborhood city
                                                            state])
  end

  def search_params
    params.permit(:page)
  end
end
