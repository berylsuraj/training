class AddColumnEmailAndConfirmationToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :email, :string
    add_column :employees, :email_confirmation, :string
  end
end
