class RemoveUserFromTrips < ActiveRecord::Migration[6.1]
  def change
    remove_reference :trips, :user, null: true, foreign_key: true
  end
end