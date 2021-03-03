class TripsStylesController < ApplicationController
  def index
    @trip_styles = TripStyle.All
    # http://localhost:3000/trips/1/trip_styles/index
    @trip = Trip.find(params[:trip_id])
    # @trip_style = TripStyle.new(trip_style_params)
    @trip_styles.trip = @trip
  end

  private

  def trip_style_params
    params.require(:trip_style).permit(:trip_id, :title)
  end
end
