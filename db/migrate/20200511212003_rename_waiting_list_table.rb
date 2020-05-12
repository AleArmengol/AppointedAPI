class RenameWaitingListTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :waiting_lists, :waiting_list_items
  end
end
