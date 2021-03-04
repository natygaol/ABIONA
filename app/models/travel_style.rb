class TravelStyle < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  has_one_attached :photo
end
