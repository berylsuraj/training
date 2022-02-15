class EmployeesController < ApplicationController
  def index
    #render('show')
    @employees=Employee.all
    #@employee=Employee.find(1)
  end

  def new
    
  end

end
