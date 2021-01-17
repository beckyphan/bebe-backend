class Api::V1::DaysController < ApplicationController
  # before_action :set_api_v1_day, only: [:show, :update, :destroy]
  #
  # # GET /api/v1/days
  def index
    @bebe = Bebe.find_by_id(params[:bebe_id])
    @bebe_days = @bebe.days

    @bebe_days_json = DaySerializer.new(@bebe_days).serialized_json

    render json: @bebe_days_json
  end
  #
  # # GET /api/v1/days/1
  # def show
  #   render json: @api_v1_day
  # end
  #
  # # POST /api/v1/days
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
  #
  # # PATCH/PUT /api/v1/days/1
  # def update
  #   if @api_v1_day.update(api_v1_day_params)
  #     render json: @api_v1_day
  #   else
  #     render json: @api_v1_day.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /api/v1/days/1
  # def destroy
  #   @api_v1_day.destroy
  # end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_api_v1_day
    #   @api_v1_day = Api::V1::Day.find(params[:id])
    # end
    #
    # # Only allow a trusted parameter "white list" through.
    def day_params
      params.require(:day).permit(:picture, :date, :note)
    end
end
