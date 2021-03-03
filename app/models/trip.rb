class Trip < ApplicationRecord
  belongs_to :user, required: false
  has_many :trip_stops
  has_many :trip_styles
end
