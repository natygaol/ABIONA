class SampleItinerariesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @sample_itineraries = SampleItinerary.joins(:sample_itinerary_travel_styles)
                                         .where(sample_itinerary_travel_styles: {travel_style_id: @trip.travel_style_ids}).distinct
    @values = []
    @trip.travel_styles.each do |travel_style| 
      @values << travel_style.title
    end
  end
end
