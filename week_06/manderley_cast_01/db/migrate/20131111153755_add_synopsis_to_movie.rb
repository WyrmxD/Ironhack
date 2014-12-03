class AddSynopsisToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :synopsis, :text
  end
end
