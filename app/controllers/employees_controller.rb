class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params(:first_name,:last_name,:title,:alias,:office,:dog_id))

    if @employee.valid?
      @employee = Employee.create(employee_params(:first_name,:last_name,:title,:alias,:office,:dog_id))
      redirect_to @employee
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params(:first_name,:last_name,:title,:alias,:office,:dog_id))
    if @employee.valid?
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def employee_params(*args)
    params.require(:employee).permit(args)
  end
end
