class AddCleanUri < ActiveRecord::Migration
  def change
  	add_column :challenges, :clean_uri, :text
  end
end
