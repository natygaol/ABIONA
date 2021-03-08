class SampleItinerariesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @sample_itineraries = SampleItinerary.joins(:sample_itinerary_travel_styles)
                                         .where(sample_itinerary_travel_styles: {travel_style_id: @trip.travel_style_ids})
    
  end
end
