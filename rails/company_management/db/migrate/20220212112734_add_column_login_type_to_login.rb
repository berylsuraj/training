class AddColumnLoginTypeToLogin < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :login_type, :string
  end
end
