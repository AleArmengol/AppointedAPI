class AddIndexToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_index :doctors, :email
  end
end
