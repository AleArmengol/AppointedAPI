class WeeklyPreset < ApplicationRecord
  belongs_to :doctor
  has_many :weekly_presets_daily_presets
  has_many :daily_presets, through: :weekly_presets_daily_presets
end
