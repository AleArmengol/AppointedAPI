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
      appointment = Appointment.available.where(doctor_id: doctor_id).where(speciality_name: speciality_name).where('extract(day from start_time) = ?', day).where('extract(month from start_time) = ?', month).where('extract(year from start_time) = ?', year)
    end
    render json: appointment
  end

  # # POST /appointments
  # def create
  #   @appointment = Appointment.new(appointment_params)

  #   if @appointment.save
  #     render json: @appointment, status: :created, location: @appointment
  #   else
  #     render json: @appointment.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /appointments/1
  # def update
  #   if @appointment.update(appointment_params)
  #     render json: @appointment
  #   else
  #     render json: @appointment.errors, status: :unprocessable_entity
  #   end
  # end

  
  def update
    patientId=params[:patient_id]
    patientName= params[:patient_name]
    appointment = Appointment.find(params[:id])
    
    case appointment.status
                    when 'booked'
                      appointment.cancelled!
                    when 'available'
                      appointment.booked!
                      appointment.update(patient_id: patientId)
                      appointment.update(patient_name: patientName)
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
