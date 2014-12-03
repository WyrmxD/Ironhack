class ChangeColumnUserFromComment < ActiveRecord::Migration
  def change
  	remove_column :comments, :author
  	change_column :comments, :body, :text
  end
end
