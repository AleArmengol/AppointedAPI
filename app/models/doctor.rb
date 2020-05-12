class Doctor < ApplicationRecord
    has_many :doctor_specialities
    has_many :specialities, through: :doctor_specialities
    has_many :daily_presets
    has_many :weekly_presets
    has_many :appointments
    has_many :waiting_list_items
end

# comentario branch mini