class AddChildrenPriceToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :children_price, :integer
  end
end
