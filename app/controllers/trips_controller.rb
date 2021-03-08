class TripsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.sent = false #eventualmente esto hay que ponerlo en el modelo y schema
    @trip.total_days = (@trip.start_date - @trip.end_date).to_i * @trip.children_price + (@trip.start_date - @trip.end_date).to_i * @trip.adult_price
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

  def show
    @trip = Trip.find(params[:id])
  end

  # def trip_status
  #   @trip = Trip.find(params[:id])
  #   @trip.status = true
  #   if @trip.save!
  #     redirect_to confirmation_path
  #   else
  #     render :
  #   end
  # end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :adults, :children, travel_style_ids:[], )
  end
end
