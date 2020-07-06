class WeeklyPresetDailyPresetsController < ApplicationController
  before_action :set_weekly_preset_daily_preset, only: [:show, :update, :destroy]

  # GET /weekly_preset_daily_presets
  def index
    @weekly_preset_daily_presets = WeeklyPresetDailyPreset.all

    render json: @weekly_preset_daily_presets
  end

  # GET /weekly_preset_daily_presets/1
  def show
    render json: @weekly_preset_daily_preset
  end

  # POST /weekly_preset_daily_presets
  def create
    @weekly_preset_daily_preset = WeeklyPresetDailyPreset.new(weekly_preset_daily_preset_params)

    if @weekly_preset_daily_preset.save
      render json: @weekly_preset_daily_preset, status: :created, location: @weekly_preset_daily_preset
    else
      render json: @weekly_preset_daily_preset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weekly_preset_daily_presets/1
  def update
    if @weekly_preset_daily_preset.update(weekly_preset_daily_preset_params)
      render json: @weekly_preset_daily_preset
    else
      render json: @weekly_preset_daily_preset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weekly_preset_daily_presets/1
  def destroy
    @weekly_preset_daily_preset.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_preset_daily_preset
      @weekly_preset_daily_preset = WeeklyPresetDailyPreset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def weekly_preset_daily_preset_params
      params.require(:weekly_preset_daily_preset).permit(:daily_preset_id, :weekly_preset_id, :day)
    end
end
