class CreateNannyQualificationShips < ActiveRecord::Migration[5.0]
  def change
    create_table :nanny_qualification_ships do |t|
      t.integer :nanny_id
      t.integer :qualification_id

      t.timestamps
    end
    add_index :nanny_qualification_ships, :nanny_id
    add_index :nanny_qualification_ships, :qualification_id
  end
end
