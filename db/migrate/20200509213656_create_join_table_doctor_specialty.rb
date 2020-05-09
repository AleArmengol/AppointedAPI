class CreateJoinTableDoctorSpecialty < ActiveRecord::Migration[6.0]
  def change
    create_join_table :doctors, :specialties do |t|
      # t.index [:doctor_id, :specialty_id]
      # t.index [:specialty_id, :doctor_id]
      # t.references :specialty, index: true, foreign_key: true
      # t.references :doctor, index: true, foreign_key: true
      
    end
  end
end
