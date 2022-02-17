class EmployeesController < ApplicationController
  def index
   
  end

  def new
    
  end

  def create 

  end

  def show
    @employee = Employee.find(params[:employee_id])
  end

end
