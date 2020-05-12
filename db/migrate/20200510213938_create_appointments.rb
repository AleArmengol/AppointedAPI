class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: true, foreign_key: true
      t.string :speciality_name
      t.string :status
      t.datetime :end_time
      t.datetime :start_time
      t.string :doctor_name
      t.string :patient_name

      t.timestamps
    end
  end
end
