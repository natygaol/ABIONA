class CreateTravelStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_styles do |t|
      t.string :title

      t.timestamps
    end
  end
end
