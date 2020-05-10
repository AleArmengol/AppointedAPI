class CreateDailyPresets < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_presets do |t|
      t.references :speciality, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
