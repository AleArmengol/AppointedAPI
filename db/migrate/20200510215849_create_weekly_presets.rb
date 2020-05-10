class CreateWeeklyPresets < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_presets do |t|
      t.references :doctor, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
