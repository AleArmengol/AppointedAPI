class AppointmentDatesController < ApplicationController
  def index
    dates = Appointment.where(speciality_name: params[:speciality_name]).available.pluck(:start_time).map(&:to_date).uniq

    @appointment_dates = dates.map do |date|
        AppointmentDate.new(date)
    end
    render json: @appointment_dates, each_serializer: AppointmentDatesSerializer
  end
end