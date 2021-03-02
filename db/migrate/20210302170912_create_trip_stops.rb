class CreateTripStops < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_stops do |t|
      t.integer :nights
      t.references :trip, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
