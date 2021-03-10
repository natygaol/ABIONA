class TripStopsController < ApplicationController
  # before_action :set_trip_stop_nights_counter

  def increase_nights
    @trip_stop = TripStop.find(params[:id])
    @trip_stop.increase_one_night!
    @trip_stop.save
    trip = @trip_stop.trip
    trip.set_end_date!
    trip.save!
    redirect_to customize_path(@trip_stop.trip, anchor: "trip-stop-#{@trip_stop.id}")
  end

  def decrease_nights
    @trip_stop = TripStop.find(params[:id])
    @trip_stop.decrease_one_night!
    @trip_stop.save
    trip = @trip_stop.trip
    trip.set_end_date!
    trip.save!
    redirect_to customize_path(@trip_stop.trip, anchor: "trip-stop-#{@trip_stop.id}")
  end

  private

  def trip_stop_params
    params.require(:trip_stop).permit(:nights)
  end
end
