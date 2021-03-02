class CreateStops < ActiveRecord::Migration[6.1]
  def change
    create_table :stops do |t|
      t.integer :nights
      t.references :accommodation, null: false, foreign_key: true
      t.references :sample_itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
