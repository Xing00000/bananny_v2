class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :zipcode_id
      t.string :address
      t.string :location_type
      t.integer :locationable_id
      t.string :locationable_type

      t.timestamps
    end
    add_index :locations, :zipcode_id
  end
end
