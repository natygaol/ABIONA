class Trip < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :sample_itinerary, optional: true
  has_many :trip_stops
  has_many :trip_styles
  has_many :travel_styles, through: :trip_styles
  accepts_nested_attributes_for :travel_styles
  validates :start_date, :end_date, :adults, presence: true
end
