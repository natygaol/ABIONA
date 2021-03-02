class CreateSampleItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :sample_itineraries do |t|

      t.timestamps
    end
  end
end
