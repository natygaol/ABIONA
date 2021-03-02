class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :description
      t.string :name
      t.integer :price
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
