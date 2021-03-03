class CreateTripStopActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_stop_activities do |t|
      t.references :trip_stop, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
