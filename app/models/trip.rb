class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :sample_itinerary, optional: true
  has_many :trip_stops
  has_many :trip_styles
  has_many :travel_styles, through: :trip_styles
  accepts_nested_attributes_for :travel_styles
  validates :start_date, :end_date, :adults, presence: true


  def set_end_date!
    self.end_date = start_date + trip_stops.reduce(0) { |accumulator, trip_stop| accumulator + trip_stop.nights }
  end

  def total_price
    total_nights * children_price * children + total_nights * adult_price * adults
  end

  def total_nights
    trip_stops.reduce(0) { |accumulator, trip_stop| accumulator + trip_stop.nights }
  end
end
