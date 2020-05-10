class WeeklyPresetDailyPreset < ApplicationRecord
  belongs_to :daily_preset
  belongs_to :weekly_preset
end
