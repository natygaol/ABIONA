class TravelStyle < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  has_one_attached :photo
  has_many :trip_styles
  has_many :trips, through: :trip_styles
  before_save :setphoto

  PHOTOS = {
  "Romantic" => "https://images.unsplash.com/photo-1496947850313-7743325fa58c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80",
  "Active" => "https://res.cloudinary.com/dafd6bi7v/image/upload/v1614888384/activities/LakeDuluti_Biking_4_wbasvw.jpg",
  "Walking" => "https://res.cloudinary.com/dafd6bi7v/image/upload/v1614888638/activities/Lake_Manyara_Board_walk-33_ohj8hb.jpg",
  "Beach" => "https://images.unsplash.com/photo-1547531455-c20b677ded4b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80",
  "Family" => "https://www.bodakadventures.co.tz/wp-content/uploads/2018/12/family-safari-game-drive-tanzania.jpg",
  "Cultural" => "https://res.cloudinary.com/dafd6bi7v/image/upload/v1614889036/activities/DSC09379_1_tt6tit.jpg",
  "Fly Camping" => "https://images.unsplash.com/photo-1517824806704-9040b037703b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "Canoe" => "https://res.cloudinary.com/dafd6bi7v/image/upload/v1614895201/activities/Canoeing_Arusha_NP_with_buffaloes_u3x0sp.jpg",
  "Gourmet" => "https://images.unsplash.com/photo-1544510807-78268e067c70?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1653&q=80",
}
  def setphoto
    self.picture = PHOTOS[self.title]
  end

end
