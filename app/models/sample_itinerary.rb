class SampleItinerary < ApplicationRecord
  has_many :sample_itinerary_travel_styles
  has_many :travel_styles, through: :sample_itinerary_travel_styles
  has_many :stops, dependent: :destroy
end
