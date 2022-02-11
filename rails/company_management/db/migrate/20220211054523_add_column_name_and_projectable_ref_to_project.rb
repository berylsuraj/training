class AddColumnNameAndProjectableRefToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :name, :string
    add_reference :projects, :projectable, polymorphic: true
  end
end
