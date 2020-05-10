class Doctor < ApplicationRecord
    has_many :doctor_specialties
    has_many :specialties, through: :doctor_specialties
    has_many :daily_presets
    has_many :weekly_presets
end
