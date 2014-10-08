class AddUserInfor < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :password, :string
  	add_column :users, :active_status, :string
  	add_column :users, :active_key, :string
  	add_column :users, :active_key_sent, :datetime
  end
end
