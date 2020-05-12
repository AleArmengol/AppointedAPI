class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient, optional: true

  enum status: [:available, :booked, :confirmed, :cancelled]
end
