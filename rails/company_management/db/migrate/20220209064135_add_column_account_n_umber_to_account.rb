class AddColumnAccountNUmberToAccount < ActiveRecord::Migration[7.0]
  def change
  	add_column :accounts, :account_num, :string
  end
end
