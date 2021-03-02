class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.integer :adults
      t.integer :children
      t.boolean :sent

      t.timestamps
    end
  end
end
