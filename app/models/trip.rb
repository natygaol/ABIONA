class Trip < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :sample_itinerary, optional: true
  has_many :trip_stops
  has_many :trip_styles
  has_many :travel_styles, through: :trip_styles
  accepts_nested_attributes_for :travel_styles
  validates :start_date, :end_date, :adults, presence: true

  before_save :create_trip_stops

  private

  def create_trip_stops
    return unless sample_itinerary_id_changed?

    trip_stops.destroy_all

    sample_itinerary.stops.each do |stop|
      trip_stops.create(
        accommodation: stop.accommodation,
        nights: stop.nights
      )
    end
  end
end
