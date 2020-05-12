class WaitingListsController < ApplicationController
  before_action :set_waiting_list, only: [:show, :update, :destroy]

  # GET /waiting_lists
  def index
    @waiting_lists = WaitingList.all

    render json: @waiting_lists
  end

  # GET /waiting_lists/1
  def show
    render json: @waiting_list
  end

  # POST /waiting_lists
  def create
    @waiting_list = WaitingList.new(waiting_list_params)

    if @waiting_list.save
      render json: @waiting_list, status: :created, location: @waiting_list
    else
      render json: @waiting_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /waiting_lists/1
  def update
    if @waiting_list.update(waiting_list_params)
      render json: @waiting_list
    else
      render json: @waiting_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /waiting_lists/1
  def destroy
    @waiting_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiting_list
      @waiting_list = WaitingList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def waiting_list_params
      params.require(:waiting_list).permit(:patient_id, :doctor_id, :speciality_id)
    end
end
