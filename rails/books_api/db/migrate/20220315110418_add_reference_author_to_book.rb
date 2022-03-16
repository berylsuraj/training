class AddReferenceAuthorToBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :writer, foreign_key: true
  end
end
