class DepartmentController < ApplicationController
  
  def index
    @departments=Department.all
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
