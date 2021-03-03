class TripStopActivity < ApplicationRecord
  belongs_to :trip_stop
  belongs_to :activity
end
