class Stop < ApplicationRecord
  belongs_to :accommodation
  belongs_to :sample_itinerary
end
