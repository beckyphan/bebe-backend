class Api::V1::TrackingsController < ApplicationController

  #index - fetch all tracking data for day

  #create - create a new data point

  #update - edit an existing data point

  #delete - delete an existing data point

  private

  def set_day
    @day = Day.find_by_id(params[:day_id])
  end

  def tracking_params
    params.require(:tracking).permit(:info_type, :start_time, :end_time, :amount, :amount_unit, :note)
  end
end
