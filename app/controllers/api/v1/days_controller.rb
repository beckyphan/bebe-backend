class Api::V1::DaysController < ApplicationController
  # before_action :set_api_v1_day, only: [:show, :update, :destroy]
  #
  # # GET /api/v1/days
  # def index
  #   @api_v1_days = Api::V1::Day.all
  # 
  #   render json: @api_v1_days
  # end
  #
  # # GET /api/v1/days/1
  # def show
  #   render json: @api_v1_day
  # end
  #
  # # POST /api/v1/days
  # def create
  #   @api_v1_day = Api::V1::Day.new(api_v1_day_params)
  #
  #   if @api_v1_day.save
  #     render json: @api_v1_day, status: :created, location: @api_v1_day
  #   else
  #     render json: @api_v1_day.errors, status: :unprocessable_entity
  #   end
  # end
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
    # def api_v1_day_params
    #   params.require(:api_v1_day).permit(:picture, :date, :note, :belongs_to)
    # end
end
