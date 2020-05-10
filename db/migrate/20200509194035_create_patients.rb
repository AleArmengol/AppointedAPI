class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :last_name
      t.string :payment_
      t.boolean :uptodate
      t.string :phone_number
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
