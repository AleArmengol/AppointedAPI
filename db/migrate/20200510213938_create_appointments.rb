class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.string :speciality_name
      t.string :name
      t.string :status
      t.string :end_time
      t.string :start_time
      t.string :doctor_name
      t.string :patient_name
      t.string :length
      t.datetime :date

      t.timestamps
    end
  end
end
