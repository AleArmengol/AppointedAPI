class DailyPresetsController < ApplicationController
  before_action :set_daily_preset, only: [:show, :update, :destroy]

  # GET /daily_presets
  def index
    @daily_presets = DailyPreset.all

    render json: @daily_presets
  end

  # GET /daily_presets/1
  def show
    render json: @daily_preset
  end

  # POST /daily_presets
  def create
    @daily_preset = DailyPreset.new(daily_preset_params)

    if @daily_preset.save
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
