class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_stops
  has_many :travel_styles, through: :trip_styles
end
