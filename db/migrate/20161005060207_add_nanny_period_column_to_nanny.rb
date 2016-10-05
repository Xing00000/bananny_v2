class AddNannyPeriodColumnToNanny < ActiveRecord::Migration[5.0]
  def change
  	add_column(:nannies, :long_tern, :boolean)
  	add_column(:nannies, :short_tern, :boolean)
  end
end
