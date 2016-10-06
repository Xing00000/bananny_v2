class CreateScheduleSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_settings do |t|
    	t.integer :nanny_id
    	t.integer :week
    	t.time :start_at
    	t.time :end_at
      t.boolean :available
      t.timestamps
    end
    add_index :schedule_settings, :nanny_id
    add_index :schedule_settings, :week
    add_index :schedule_settings, :available
  end
end
