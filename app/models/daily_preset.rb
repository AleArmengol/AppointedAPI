class DailyPreset < ApplicationRecord
  belongs_to :speciality #TODO do we need a belongs_to in speciality?
  belongs_to :doctor
  has_many :weekly_preset_daily_presets
  has_many :time_frames
  has_many :weekly_presets, through: :weekly_preset_daily_presets
  has_many :time_frames, dependent: :destroy
end
