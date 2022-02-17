class EmployeesController < ApplicationController
  def index
   
  end

  def create 
   #debugger
    @employee = Employee.new(name:params[:ename],age:params[:age],salary:params[:salary],department_id:params[:department_id])
    if @employee.save
      @status="Saved Successfully"
    else
      @status="Error"
    end
  end

  def show
    @employee = Employee.find(params[:employee_id])
  end

end
