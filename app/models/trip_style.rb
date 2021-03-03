class TripStyle < ApplicationRecord
  belongs_to :trip
  belongs_to :travel_style
end
