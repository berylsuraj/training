class AddEmployeeReferenceToAccount < ActiveRecord::Migration[7.0]
  def change
  	add_reference :accounts, :employee, foreign_key: true
  end
end
