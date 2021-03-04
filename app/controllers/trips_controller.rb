class TripsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :adults, :children)
  end

end
