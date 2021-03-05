class TripsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user 
    @trip.sent = false #eventualmente esto hay que ponerlo en el modelo y schema
    if @trip.save
      redirect_to edit_trip_path(@trip)
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
    redirect_to sample_itineraries_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :adults, :children, travel_style_ids:[])
  end
end
