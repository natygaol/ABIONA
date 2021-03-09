class AddChildrenPricePerNightToSampleItinerary < ActiveRecord::Migration[6.1]
  def change
    add_column :sample_itineraries, :children_price_per_night, :integer
  end
end
