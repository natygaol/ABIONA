class TripStopsController < ApplicationController
  def increase_nights
    @trip_stop = TripStop.find(params[:id])
    @trip_stop.increase_one_night!
    @trip_stops.save
  end

  private

  def trip_stop_params
    params.require(:trip_stop).permit(:nights)
  end
end
