class RemoveAuthorFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :author
  end
end
