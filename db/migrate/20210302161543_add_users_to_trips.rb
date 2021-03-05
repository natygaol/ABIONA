class AddUsersToTrips < ActiveRecord::Migration[6.1]
  def change
    add_reference :trips, :user, null: true, foreign_key: true
  end
end
