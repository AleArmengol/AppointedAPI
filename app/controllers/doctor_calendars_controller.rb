class DoctorCalendarsController < ApplicationController
  before_action :set_doctor_calendar, only: [:show, :update, :destroy]

  # GET /doctor_calendars
  def index
    @doctor_calendars = DoctorCalendar.all

    render json: @doctor_calendars
  end

  # GET /doctor_calendars/1
  def show
    render json: @doctor_calendar
  end

  # POST /doctor_calendars
  def create
    @doctor_calendar = DoctorCalendar.new(doctor_calendar_params)

    if @doctor_calendar.save
      render json: @doctor_calendar, status: :created, location: @doctor_calendar
    else
      render json: @doctor_calendar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctor_calendars/1
  def update
    if @doctor_calendar.update(doctor_calendar_params)
      render json: @doctor_calendar
    else
      render json: @doctor_calendar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctor_calendars/1
  def destroy
    @doctor_calendar.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_calendar
      @doctor_calendar = DoctorCalendar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doctor_calendar_params
      params.require(:doctor_calendar).permit(:speciality_name, :start_time, :end_time, :status)
    end
end
