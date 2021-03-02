class CreateSampleItineraryTravelStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :sample_itinerary_travel_styles do |t|
      t.references :sample_itinerary, null: false, foreign_key: true
      t.references :travel_style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
