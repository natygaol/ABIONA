class ChangeCategoryInAccommodation < ActiveRecord::Migration[6.1]
  def change
    change_column :accommodations, :category, :integer, using: 'category::integer' 
  end
end
