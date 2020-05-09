class RemoveUptodateFromPatients < ActiveRecord::Migration[6.0]
  def change

    remove_column :patients, :uptodate, :boolean
  end
end
