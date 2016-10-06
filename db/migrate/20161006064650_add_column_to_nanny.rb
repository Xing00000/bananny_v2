class AddColumnToNanny < ActiveRecord::Migration[5.0]
  def change
  	add_column(:nannies, :min_care_hour, :integer)
  end
end
