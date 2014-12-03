class AddIndexUsernameToUser < ActiveRecord::Migration
  def change
	add_index :users, :username, { name: 'username_index', unique: true }
  end
end
