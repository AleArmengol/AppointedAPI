class DoctorsController < ApplicationController
  # before_action :set_doctor, only: [:show, :update, :destroy]

  # GET /doctors
  def index
    speciality_id = params[:id] #mandatory
    day = params[:day] #not mandatory
    month = params[:month] #not mandatory
    year = params[:year] #not mandatory
    hour = params[:hour] #not mandatory
    min = params[:min] #not mandatory
    doctors = Doctor.joins(:appointments).where(appointments: {speciality_name:'Cardiología'}).where(appointments: {status: 0}).uniq #filter only by speciality
    if (day == nil|| month == nil|| year == nil) && (hour == nil || min == nil) #filter only by speciality
      render json: doctors
    elsif (day != nil && month != nil && year != nil) && (hour == nil || min == nil)#filter by speciality and date
      doctors = Appointment.where(doctor_id: doctors.select(:id)).where('extract(day from start_time) = ?', day).where('extract(month from start_time) = ?', month).where('extract(year from start_time) = ?', year).map(&:doctor).uniq.compact
      render json: doctors
    end


    
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  # POST /doctors
  # def create
  #   @doctor = Doctor.new(doctor_params)

  #   if @doctor.save
  #     render json: @doctor, status: :created, location: @doctor
  #   else
  #     render json: @doctor.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /doctors/1
  # def update
  #   if @doctor.update(doctor_params)
  #     render json: @doctor
  #   else
  #     render json: @doctor.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /doctors/1
  # def destroy
  #   @doctor.destroy
  # end

  # private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_doctor
    #   @doctor = Doctor.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    # def doctor_params
    #   params.require(:doctor).permit(:name, :last_name, :phone_number, :email, :address)
    # end
end
