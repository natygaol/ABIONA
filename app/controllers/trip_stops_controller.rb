class TripStopsController < ApplicationController
  def increase_nights
    @trip_stop = TripStop.find(params[:id])
    @trip_stop.increase_one_night!
    @trip_stops.save
    @trip_stops.trip.update(end_date: start_date + trip.trip_stops.reduce(0) { |accumulator, trip_stop| accumulator + trip_stop.nights })
  end

  private

  def trip_stop_params
    params.require(:trip_stop).permit(:nights)
  end
end
