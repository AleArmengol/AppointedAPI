class CreateTimeFrames < ActiveRecord::Migration[6.0]
  def change
    create_table :time_frames do |t|
      t.references :daily_preset, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
