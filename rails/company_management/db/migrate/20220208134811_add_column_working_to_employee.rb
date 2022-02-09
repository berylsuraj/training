class AddColumnWorkingToEmployee < ActiveRecord::Migration[7.0]
  def change
  	add_column :employees, :is_working, :boolean
  end
end
