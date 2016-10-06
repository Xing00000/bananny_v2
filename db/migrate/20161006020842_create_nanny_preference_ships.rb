class CreateNannyPreferenceShips < ActiveRecord::Migration[5.0]
  def change
    create_table :nanny_preference_ships do |t|
    	t.integer :nanny_id
    	t.integer :preference_id
      t.timestamps
    end
    add_index :nanny_preference_ships, :nanny_id
    add_index :nanny_preference_ships, :preference_id
  end
end
