class CreateNannyZipcodeShips < ActiveRecord::Migration[5.0]
  def change
    create_table :nanny_zipcode_ships do |t|
    	t.integer :nanny_id
    	t.integer :zipcode_id
      t.timestamps
    end
    add_index :nanny_zipcode_ships, :nanny_id
    add_index :nanny_zipcode_ships, :zipcode_id
  end
end
