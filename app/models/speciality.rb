class Speciality < ApplicationRecord
    has_many :doctor_specialities
    has_many :doctors, through: :doctor_specialities
    has_many :waiting_list_items
end
