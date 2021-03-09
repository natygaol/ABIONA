class AddTotalDaysToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :total_days, :date
  end
end
