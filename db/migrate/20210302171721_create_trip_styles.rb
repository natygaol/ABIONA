class CreateTripStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_styles do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :travel_style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
