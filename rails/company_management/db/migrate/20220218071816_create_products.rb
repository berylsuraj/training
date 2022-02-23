class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :color
      t.integer :size
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
