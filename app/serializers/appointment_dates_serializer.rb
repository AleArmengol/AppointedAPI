class AppointmentDatesSerializer < ActiveModel::Serializer
  attributes :day, :month, :year #:human_date, :doctor
  # def human_date
  #   object.start_time.strftime("Booked at %m/%d/%Y")
  # end

  # def doctor
  #   DoctorSerializer.new(object.doctor)
  # end
end
