class TripsController < ApplicationController

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
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def inquiries
    @user = current_user
    @trips = Trip.where(user: current_user).where(sent: true)
  end
  
  def generate_trip_stops
    # 1 find trip
    trip = Trip.find(params[:id])
    if trip.trip_stops.blank?
    # 2 generate trip stops and its activities
      # a. find respective sample itinery
      sample_itinerary = SampleItinerary.find(params[:sample_itinerary_id])
      trip.update(sample_itinerary: sample_itinerary, children_price: sample_itinerary.children_price_per_night, adult_price: sample_itinerary.adult_price_per_night)
      # b. find its stops and iterate over them
      sample_itinerary.stops.each do |stop|
        # c. generating trip stops
        trip_stop = TripStop.new
        trip_stop.accommodation = stop.accommodation
        trip_stop.trip = trip
        trip_stop.nights = stop.nights
        trip_stop.save!
        # d. for each trip stop add the corresponding activities(given the accommodation)
        stop.accommodation.activities.first(trip_stop.nights * 2).each do |activity|
          trip_stop_activity = TripStopActivity.create!(trip_stop: trip_stop, activity: activity)
        end
      end
    end
    #3 save all
    redirect_to customize_path(trip)
  end

  def customize
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :adults, :children, :children_price, :adult_price , travel_style_ids:[])
  end
end
