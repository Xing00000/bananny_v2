class CreateInHomeNannies < ActiveRecord::Migration[5.0]
  def change
    create_table :in_home_nannies do |t|
      t.integer :nanny_id
      t.integer :hope_baby_quantity
      t.integer :number_of_baby_care

      t.timestamps
    end
    add_index :in_home_nannies, :nanny_id
  end
end
