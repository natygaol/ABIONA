class Trip < ApplicationRecord
  has_many :trip_stops
  has_many :trip_styles
end
