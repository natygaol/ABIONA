class TripStop < ApplicationRecord
  belongs_to :trip
  belongs_to :accommodation
  has_many :trip_stop_activities
end
