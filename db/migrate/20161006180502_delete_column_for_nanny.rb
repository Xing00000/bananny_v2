class DeleteColumnForNanny < ActiveRecord::Migration[5.0]
  def change
  	remove_column(:nannies, :qualification)
  	remove_column(:nannies, :orther_qualification)
  end
end
