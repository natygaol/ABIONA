class TravelStyle < ApplicationRecord
  has_many :trip_styles
  has_many :trips, through: :trip_styles
end
