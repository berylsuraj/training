class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
