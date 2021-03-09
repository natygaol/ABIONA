class Trip < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :sample_itinerary, optional: true
  has_many :trip_stops
  has_many :trip_styles
  has_many :travel_styles, through: :trip_styles
  accepts_nested_attributes_for :travel_styles
  validates :start_date, :end_date, :adults, presence: true
  before_save :create_trip_stops

  def total_price
    # 1 migration. anadir a sample itineraries las columnas de children_price_per_night & adult_price_per_night
    # 2 Actualizar las seeds // sample itineraries
    # A Al actualizar las noches de un trip stop debo actualizar el end date del trip
    #   1 En el trip stop controller en las acciones que actualizan sus nights deberia suceder esto
    #   2 trip.update(end_date: start_date + trip.trip_stops.reduce(0) { |accumulator, trip_stop| accumulator + trip_stop.nights })
    return nil unless sample_itinerary.present?
    (end_date - start_date).to_i * sample_itinerary.children_price_per_night +
      (end_date - start_date).to_i * sample_itinerary.adult_price_per_night
  end

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