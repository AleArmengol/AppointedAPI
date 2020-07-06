class AppointmentsController < ApplicationController
  # before_action :set_appointment, only: [:show, :update, :destroy, :index]

  # GET /appointments
  # def index
  #   @appointments = Appointment.all

  #   render json: @appointments
  # end

  # patient_id
  # status => booked, cancelled or available

  def index
    patient = Patient.find(params[:patient_id])

    appointments  = case params[:status]
                      when 'booked'
                        patient.appointments.booked
                      when 'cancelled'
                        patient.appointments.cancelled
                      when 'past'
                        patient.appointments.past
                      end

    render json: appointments
  end



  # GET /appointments/1
  def show
    if params[:id] == '0'
      doctor_id = params[:doctor_id]
      speciality_name = params[:speciality_name]
      day = params[:day]
      month = params[:month]
      year = params[:year]
      appointment = Appointment.where(doctor_id: doctor_id).where(speciality_name: speciality_name).where('extract(day from start_time) = ?', day).where('extract(month from start_time) = ?', month).where('extract(year from start_time) = ?', year)
    end
    render json: appointment
  end

  # POST /appointments
  def create
    p = params.to_unsafe_h.slice(:weekly_preset_id, :dates_to_set)
    dates = p[:dates_to_set]
    weekly_preset = WeeklyPreset.find(params[:weekly_preset_id])
    doctor = weekly_preset.doctor
    count = 0
    dates.each do |date|
      daily_preset = WeeklyPresetDailyPreset.where(day:date[:name], weekly_preset_id: weekly_preset.id)
      if daily_preset.length > 0
        daily_preset = daily_preset.last.daily_preset
        status = set_daily_preset_to_date(date, daily_preset) #return the number of appointments created or 'ERROR' if there's any booked or confirmed appointment on that day
        if status == "ERROR"
          print date[:name]
        else
          count += 1
        end
      end
    end
    render json: "OK"
  end

  def set_daily_preset_to_dates()
    p = params.to_unsafe_h.slice(:daily_preset_id, :dates_to_set)
    dates = p[:dates_to_set]
    daily_preset = DailyPreset.find(params[:daily_preset_id])
    dates.each do |date|
      set_daily_preset_to_date(date, daily_preset)
    end
    render json: "OK"
  end


  private
  def set_daily_preset_to_date(date, daily_preset)
    time_frames = daily_preset.time_frames
    doctor = daily_preset.doctor
    speciality = daily_preset.speciality
    appointments = Appointment.where('DATE(start_time) = ?', Date.new(date[:year], date[:month], date[:day]))
    count = 0
    booked_appointments = appointments.booked.length
    confirmed_appointments = appointments.confirmed.length
    if booked_appointments != 0 or confirmed_appointments !=0
      return "ERROR"
    else
      appointments.destroy_all
      time_frames.each do |time_frame|
        start_at = DateTime.new(date[:year], date[:month], date[:day], time_frame.start_time.hour, time_frame.start_time.min, time_frame.start_time.sec, Rational(-3, 24))
        end_time = DateTime.new(date[:year], date[:month], date[:day], time_frame.end_time.hour, time_frame.end_time.min, time_frame.end_time.sec, Rational(-3, 24))
        current_time = start_at
        while current_time + 30.minutes <= end_time
          appointment = doctor.appointments.create(start_time: current_time, end_time: current_time + 30.minutes, doctor_name: doctor.name + ' ' + doctor.last_name, speciality_name: speciality.name)
          count += 1
          current_time += 30.minutes
        end
      end
    end
    return count
  end


  # # PATCH/PUT /appointments/1
  # def update
  #   if @appointment.update(appointment_params)
  #     render json: @appointment
  #   else
  #     render json: @appointment.errors, status: :unprocessable_entity
  #   end
  # end

  def update
    appointment = Appointment.find_by(params[:id])
    case appointment.status
                    when 'booked'
                      appointment.update(status:3)
                    when 'available'
                      appointment.update(status:1)
    end

    render json: appointment
  end
  # # DELETE /appointments/1
  # def destroy
  #   @appointment.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_appointment
  #     @appointment = Appointment.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  #   def appointment_params
  #     params.require(:appointment).permit(:doctor_id, :patient_id, :speciality_name, :name, :status, :end_time, :start_time, :doctor_name, :patient_name, :length, :date)
  #   end
end
