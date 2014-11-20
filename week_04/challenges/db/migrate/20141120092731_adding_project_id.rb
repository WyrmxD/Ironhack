class AddingProjectId < ActiveRecord::Migration
  def change
  	add_column :supporters, :challenge_id, :integer
  end
end
