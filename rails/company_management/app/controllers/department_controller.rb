class DepartmentController < ApplicationController
  def new

  end
  
  def create
    @department=Department.new(name:params[:dname])
    if @department.save
      @status="Department saved"
    else
      @status="Error"
    end
  end
end
