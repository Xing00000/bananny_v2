class CreateNannyOrtherQualificationShips < ActiveRecord::Migration[5.0]
  def change
    create_table :nanny_orther_qualification_ships do |t|
      t.integer :nanny_id
      t.integer :orther_qualification_id

      t.timestamps
    end
    add_index :nanny_orther_qualification_ships, :nanny_id
    add_index :nanny_orther_qualification_ships, :orther_qualification_id,  :name => 'orther_qualification_index'
  end
end
