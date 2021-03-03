class TripsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save?
      redirect_to rooth_path
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :adults, :children)
  end

end
