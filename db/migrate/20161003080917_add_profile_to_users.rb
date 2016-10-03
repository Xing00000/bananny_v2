class AddProfileToUsers < ActiveRecord::Migration[5.0]
  def change
		add_column :users, :name, :string
  	add_column :users, :nickname, :string
  	add_column :users, :gender, :string
  	add_column :users, :phone, :string
  	add_column :users, :birthdate, :date
  	add_column :users, :type, :string
  	add_column :users, :line_id, :string
  	add_column :users, :fb_uid, :string
  	add_column :users, :fb_token, :string
  	add_column :users, :fb_raw_data, :string
  	add_column :users, :fb_pic, :string

  	add_index :users, :fb_uid
  end
end
