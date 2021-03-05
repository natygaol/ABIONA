class AddColumnToStops < ActiveRecord::Migration[6.1]
  def change
    add_column :stops, :place, :string
  end
end
