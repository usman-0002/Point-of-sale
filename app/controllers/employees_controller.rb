class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[show edit update destroy]
  def index
    @pagy, @employees = pagy(Employee.includes(:employee_detail))
  end

  def new
    @employee = Employee.new
    @employee_detail = UserDetail.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee_detail = UserDetail.new(employee_detail_params)
    if @employee.save
      @employee_detail.detailable = @employee
      if @employee_detail.save
        redirect_to employees_path, notice: 'Employee added Successfully!'
      else
        flash.now[:alert] = @employee_detail.errors.full_messages
        render :new
      end
    else
      flash.now[:alert] = @employee.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @employee.update(employee_params)
      if @employee_detail.update(employee_detail_params)
        redirect_to employee_path, notice: 'Employee updated Successfully!'
      else
        flash.now[:alert] = @employee_detail.errors.full_messages
        render :edit
      end
    else
      flash.now[:alert] = @employee.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @employee.destroy
      flash[:notice] = 'Employee deleted Successfully!'
    else
      flash[:alert] = @employee.employee_detail.errors.full_messages
    end
    redirect_to employees_path
  end

  def search
    search_params = params.permit(:search)['search'].strip
    @pagy, @employees = pagy(Employee.name_filter(search_params))
    respond_to do |format|
      format.js
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:job_title, :joined_at)
  end

  def employee_detail_params
    params.require(:employee)[:user_detail].permit(:first_name, :last_name,
                                                       :email, :mobile_number,
                                                       :address, :city, :avatar)
  end

  def find_employee
    @employee = Employee.find(params[:id])
    @employee_detail = @employee.employee_detail
  end
end
