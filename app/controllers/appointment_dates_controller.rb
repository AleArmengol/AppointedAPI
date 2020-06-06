class AppointmentDatesController < ApplicationController
  def index
    speciality_name = params[:speciality_name] #mandatory
    doctor_id = params[:doctor_id] #not mandatory
    # hour = params[:hour] #not mandatory
    # min = params[:min] #not mandatory

    if !doctor_id  #&& !hour  && !min  #filter only by speciality 
      dates = Appointment.where(speciality_name: params[:speciality_name]).where('start_time > ?', Date.today).available.pluck(:start_time).map(&:to_date).uniq

    else #&& (!hour  || !min ) #filer by speciality and doctor_id
      dates = Appointment.where(speciality_name: params[:speciality_name]).where('start_time > ?', Date.today).available.where(doctor_id: doctor_id).pluck(:start_time).map(&:to_date).uniq

    # elsif !doctor_id  && hour && min #filer by speciality and time
    #   dates = Appointment.where(speciality_name: params[:speciality_name]).where('start_time > ?', Date.today).available.where('extract(hour from start_time) = ?', hour).where('extract(min from start_time) = ?', min).pluck(:start_time).map(&:to_date).uniq

    # elsif doctor_id && hour && min #filer by speciality, doctor_id and time
    #   dates = Appointment.where(speciality_name: params[:speciality_name]).where('start_time > ?', Date.today).available.where(doctor_id: doctor_id).where('extract(hour from start_time) = ?', hour).where('extract(min from start_time) = ?', min).pluck(:start_time).map(&:to_date).uniq
    end


    @appointment_dates = dates.map do |date|
        AppointmentDate.new(date)
    end
    render json: @appointment_dates, each_serializer: AppointmentDatesSerializer
  end
end