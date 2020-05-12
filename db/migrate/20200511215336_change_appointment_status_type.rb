class ChangeAppointmentStatusType < ActiveRecord::Migration[6.0]
  def up
    change_column :appointments, :status, 'integer USING CAST(status AS integer)'
    change_column :appointments, :status, :integer, default: 0
  end

  def down
    change_column :appointments, :status, :string
  end
end
