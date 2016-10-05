class FixTypeColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column(:users, :type, :user_type)
  	rename_column(:nannies, :type, :nanny_type)
  end
end
