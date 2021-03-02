class CreateAccommodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
