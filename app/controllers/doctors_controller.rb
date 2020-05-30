class DoctorsController < ApplicationController
  # before_action :set_doctor, only: [:show, :update, :destroy]

  # GET /doctors
  def index
    # doctor_specialities = DoctorSpeciality.find(params[:speciality_id])
    # doctors_specialities_id = doctor_specialities.doctor_id
    # doctors_found = Doctor.find(doctors_specialities_id.doctor_id)
    # doctors_names = doctors_found.last_name
    ds = DoctorSpeciality.where(speciality_id: params[:speciality_id])
    did = ds.select(:doctor_id)
    doctors = Doctor.where(id: did)
    
    render json: doctors

    # render json: @doctors
  end

  # GET /doctors/1
  # def show
  #   render json: @doctor
  # end

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
