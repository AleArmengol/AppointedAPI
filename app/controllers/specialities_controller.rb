class SpecialitiesController < ApplicationController
  before_action :set_speciality, only: [:show, :update, :destroy]

  # GET /specialities
  # def index
  #   @specialities = Speciality.all

  #   render json: @specialities
  # end

  def index
    specialities = Speciality.all
    if params[:doctor_id]
      specialities = Doctor.find(params[:doctor_id]).specialities
    end
    render json: specialities
  end

  # GET /specialities/1
  def show
    render json: @speciality
  end

  # POST /specialities
  def create
    @speciality = Speciality.new(speciality_params)

    if @speciality.save
      render json: @speciality, status: :created, location: @speciality
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specialities/1
  def update
    if @speciality.update(speciality_params)
      render json: @speciality
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specialities/1
  def destroy
    @speciality.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def speciality_params
      params.require(:speciality).permit(:name)
    end
end
