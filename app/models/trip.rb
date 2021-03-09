class Trip < ApplicationRecord
  belongs_to :user, required: false
  has_many :trip_stops
  has_many :trip_styles
  has_many :travel_styles, through: :trip_styles
  accepts_nested_attributes_for :travel_styles
  validates :start_date, :end_date, :adults, presence: true

  def total_price
    # 1 migration. anadir a sample itineraries las columnasd de children_price_per_night & adult_price_per_night
    # 2 Actualizar las seeds // sample itineraries
    # A Al actualizar las noches de un trip stop debo actualizar el end date del trip
    #   1 En el trip stop controller en las acciones que actualizan sus nights deberia suceder esto
    #   2 trip.update(end_date: start_date + trip.trip_stops.reduce(0) { |accumulator, trip_stop| accumulator + trip_stop.nights })
    return nil unless sample_itinerary.present?
    (end_date - start_date).to_i * sample_itinerary.children_price_per_night +
      (end_date - start_date).to_i * sample_itinerary.adult_price_per_night
  end
end
