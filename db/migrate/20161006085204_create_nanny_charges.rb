class CreateNannyCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :nanny_charges do |t|
    	t.integer :nanny_id
    	t.string :period
    	t.string :date_type
    	t.string :charge_name
    	t.string :charge_unit
    	t.integer :amount
      t.timestamps
    end
    add_index :nanny_charges, :nanny_id
  end
end
