class TripStop < ApplicationRecord
  belongs_to :trip
  belongs_to :accommodation
  has_many :trip_stop_activities, dependent: :destroy

  def increase_one_night!
    nights += 1
  end
end
