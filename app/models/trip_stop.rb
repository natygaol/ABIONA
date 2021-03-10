class TripStop < ApplicationRecord
  belongs_to :trip
  belongs_to :accommodation
  has_many :trip_stop_activities, dependent: :destroy
  has_many :activities, through: :trip_stop_activities

  def increase_one_night!
    self.nights += 1
  end

  def decrease_one_night!
    self.nights -= 1 if nights.positive?
  end
end
