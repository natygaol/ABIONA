class TravelStyle < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  has_one_attached :photo
  has_many :trip_styles
  has_many :trips, through: :trip_styles
end
