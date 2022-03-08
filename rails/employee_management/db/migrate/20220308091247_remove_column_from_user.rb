class RemoveColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :terms
    remove_column :users, :confirm_password
  end
end
