class AddColumnAgeNameToEmployee < ActiveRecord::Migration[7.0]
  def change
  	add_column :employees, :name, :string
  	add_column :employees, :age , :integer
  	add_column :employees, :salary, :real
  end
end
