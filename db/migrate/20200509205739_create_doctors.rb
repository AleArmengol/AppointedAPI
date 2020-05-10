class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
