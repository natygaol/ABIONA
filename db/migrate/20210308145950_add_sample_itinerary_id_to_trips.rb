class AddSampleItineraryIdToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :sample_itinerary_id, :integer
  end
end
