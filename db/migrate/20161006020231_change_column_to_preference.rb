class ChangeColumnToPreference < ActiveRecord::Migration[5.0]
  def change
  	remove_index(:preferences, :nanny_id)
  	remove_column(:preferences , :like)
  	remove_column(:preferences , :nanny_id)
  end
end
