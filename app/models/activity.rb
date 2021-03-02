class Activity < ApplicationRecord
  belongs_to :accommodation
  has_many :trip_stop_activities 
end
