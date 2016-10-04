class FbRawDataToText < ActiveRecord::Migration[5.0]
  def change
  	change_column(:users, :fb_raw_data, :text)
  end
end
