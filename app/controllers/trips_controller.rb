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
    redirect_to trip_sample_itineraries_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def generate_trip_stops
    #1 find trip
    trip = Trip.find(params[:id])
    #2 generate trip stops and its activities
      #a. find respective sample itinery
      sample_itinerary = SampleItinerary.find(trip.sample_itinerary_id)
      #b. find its stops and iterate over them
      sample_itinerary.stops.each do |stop|    
        #c. generating trip stops
        trip_stop = TripStop.new
        trip_stop.accommodation = stop.accommodation
        trip_stop.trip = trip
        trip_stop.nights = stop.nights
        trip_stop.save!
        #d. for each trip stop add the corresponding activities(given the accommodation)
        stop.accommodation.activities.first(trip_stop.nights * 2).each do |activity|
          trip_stop_activity = TripStopActivity.create!(trip_stop: trip_stop, activity: activity)
        end
      end
    #3 save all
    redirect_to customize_path(trip)
  end

  def customize
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
    params.require(:trip).permit(:start_date, :end_date, :adults, :children, travel_style_ids:[])
  end
end
