class Activity < ApplicationRecord
  belongs_to :accommodation
  has_many :trip_stop_activities, dependent: :destroy
  has_one_attached :photo
end
