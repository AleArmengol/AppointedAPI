class DailyPreset < ApplicationRecord
  belongs_to :speciality
  belongs_to :doctor
  has_many :weekly_presets_daily_presets
  has_many :weekly_presets, through: :weekly_presets_daily_presets
end
