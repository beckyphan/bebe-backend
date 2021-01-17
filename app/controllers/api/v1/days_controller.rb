class Api::V1::DaysController < ApplicationController

  # GET /api/v1/days
  def index
    @bebe = Bebe.find_by_id(params[:bebe_id])
    @bebe_days = @bebe.days

    @bebe_days_json = DaySerializer.new(@bebe_days).serialized_json

    render json: @bebe_days_json
  end

  # POST /api/v1/days
  def create
    @bebe = Bebe.find_by_id(params[:bebe_id])
    @new_day = @bebe.days.new(day_params)

    if @new_day.valid?
      @new_day.save
      @day_json = DaySerializer.new(@new_day).serialized_json
      render json: @day_json, status: :created
    else
      render json: {error: @new_day.errors.messages}, status: :unprocessable_entity
    end
  end

  private
    def day_params
      params.require(:day).permit(:picture, :date, :note)
    end
end
