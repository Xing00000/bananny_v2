class CreateNannies < ActiveRecord::Migration[5.0]
  def change
    create_table :nannies do |t|
    	t.text :introduction
    	t.string :license_number
    	t.string :qualification
    	t.string :orther_qualification
    	t.date :since
    	t.date :care_start_date
    	t.string :type
    	t.string :status
    	t.integer :user_id, :index => true
      t.timestamps
    end
  end
end
