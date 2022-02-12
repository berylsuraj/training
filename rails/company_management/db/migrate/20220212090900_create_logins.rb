class CreateLogins < ActiveRecord::Migration[7.0]
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
