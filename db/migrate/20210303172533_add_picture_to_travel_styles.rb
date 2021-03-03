class AddPictureToTravelStyles < ActiveRecord::Migration[6.1]
  def change
    add_column :travel_styles, :picture, :string
  end
end
