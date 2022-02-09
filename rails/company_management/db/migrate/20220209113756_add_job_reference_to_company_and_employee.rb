class AddJobReferenceToCompanyAndEmployee < ActiveRecord::Migration[7.0]
  def change
  	add_reference :jobs, :company, foreign_key: true
  	add_reference :jobs, :employee, foreign_key: true
  end
end
