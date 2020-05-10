class RemovePaymentFromPatients < ActiveRecord::Migration[6.0]
  def change

    remove_column :patients, :payment_, :string
  end
end
