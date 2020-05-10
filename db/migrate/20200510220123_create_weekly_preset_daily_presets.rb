class CreateWeeklyPresetDailyPresets < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_preset_daily_presets do |t|
      t.references :daily_preset, null: false, foreign_key: true
      t.references :weekly_preset, null: false, foreign_key: true
      t.string :day

      t.timestamps
    end
  end
end
