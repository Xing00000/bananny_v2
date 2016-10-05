class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
    	t.integer :nanny_id
    	t.string :name
    	t.boolean :like
      t.timestamps
    end

    add_index :preferences, :nanny_id
  end
end
