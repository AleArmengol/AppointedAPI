class DailyPresetsController < ApplicationController
  before_action :set_daily_preset, only: [:show, :update, :destroy]

  # GET /daily_presets
  def index
    render json: Doctor.find(params[:doctor_id]).daily_presets
  end

  # GET /daily_presets/1
  def show
    render json: @daily_preset
  end

  # POST /daily_presets
  def create
    @daily_preset = DailyPreset.new(name: params[:name] , speciality_id: params[:speciality_id], doctor_id: params[:doctor_id])
    print params[:time_frames]
    if @daily_preset.save
      params[:time_frames].each { |tf|  @daily_preset.time_frames.create(start_time: tf[:start_time]  , end_time: tf[:end_time]  ) }
      render json: @daily_preset, status: :created, location: @daily_preset
    else
      render json: @daily_preset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daily_presets/1
  def update
    if @daily_preset.update(daily_preset_params)
      render json: @daily_preset
    else
      render json: @daily_preset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /daily_presets/1
  def destroy
    @daily_preset.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_preset
      @daily_preset = DailyPreset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def daily_preset_params
      params.require(:daily_preset).permit(:speciality_id, :doctor_id, :name)
    end
end
