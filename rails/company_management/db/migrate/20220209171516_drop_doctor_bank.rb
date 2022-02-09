class DropDoctorBank < ActiveRecord::Migration[7.0]
  def change
    drop_table :doctors
    drop_table :banks
  end
end
