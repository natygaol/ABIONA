class AddColumnsToSampleItineraries < ActiveRecord::Migration[6.1]
  def change
    add_column :sample_itineraries, :title, :string
    add_column :sample_itineraries, :description, :text
  end
end
