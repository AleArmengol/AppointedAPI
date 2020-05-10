class WeeklyPresetsController < ApplicationController
  before_action :set_weekly_preset, only: [:show, :update, :destroy]

  # GET /weekly_presets
  def index
    @weekly_presets = WeeklyPreset.all

    render json: @weekly_presets
  end

  # GET /weekly_presets/1
  def show
    render json: @weekly_preset
  end

  # POST /weekly_presets
  def create
    @weekly_preset = WeeklyPreset.new(weekly_preset_params)

    if @weekly_preset.save
      render json: @weekly_preset, status: :created, location: @weekly_preset
    else
      render json: @weekly_preset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weekly_presets/1
  def update
    if @weekly_preset.update(weekly_preset_params)
      render json: @weekly_preset
    else
      render json: @weekly_preset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weekly_presets/1
  def destroy
    @weekly_preset.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_preset
      @weekly_preset = WeeklyPreset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def weekly_preset_params
      params.require(:weekly_preset).permit(:doctor_id, :name)
    end
end
