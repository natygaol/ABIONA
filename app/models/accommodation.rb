class Accommodation < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :stops
  has_many :trip_stops
  enum category: [ :romantic, :active, :walking ]
end
