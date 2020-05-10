class CreateDoctorCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_calendars do |t|
      t.string :speciality_name
      t.date :start_time
      t.date :end_time
      t.string :status

      t.timestamps
    end
  end
end
