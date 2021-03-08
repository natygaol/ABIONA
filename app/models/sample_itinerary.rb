class SampleItinerary < ApplicationRecord
  has_many :sample_itinerary_travel_styles
  has_many :travel_styles, through: :sample_itinerary_travel_styles
  has_many :stops, dependent: :destroy
  has_one_attached :photo

  def total_nights
    stops.map { |stop| stop.nights }.sum  
  end
  
end

