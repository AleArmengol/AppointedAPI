class AddPaymentUptodateToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :payment_uptodate, :boolean
  end
end
