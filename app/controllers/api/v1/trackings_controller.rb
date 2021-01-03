class Api::V1::TrackingsController < ApplicationController
  before_action :set_day

  #index - fetch all tracking data for day
  def index
    trackings_json = TrackingSerializer.new(@day.trackings).serialized_json
    render json: trackings_json
  end

  #create - create a new data point
  def create
  end

  #update - edit an existing data point
  def update
  end

  #delete - delete an existing data point
  def destroy
  end

  private

  def set_day
    @day = Day.find_by_id(params[:day_id])
  end

  def tracking_params
    params.require(:tracking).permit(:info_type, :start_time, :end_time, :amount, :amount_unit, :note)
  end
end
