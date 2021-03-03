class TravelStyle < ApplicationRecord
  has_many :trips, through: :trip_styles
end
