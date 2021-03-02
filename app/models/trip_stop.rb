class TripStop < ApplicationRecord
  belongs_to :trip
  belongs_to :accommodation
end
