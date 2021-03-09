class AddAdultPriceToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :adult_price, :integer
  end
end
