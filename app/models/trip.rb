class Trip < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user, required: false
=======
  belongs_to :user
  has_many :trip_stops
  has_many :trip_styles
>>>>>>> master
end
