class Zipcode < ActiveRecord::Migration[5.0]
  def change
  	create_table :zipcodes do |t|
    	t.integer :zipcode
      t.string :city
      t.string :area
      t.timestamps
    end

    add_index :zipcodes, :zipcode
  end
end
