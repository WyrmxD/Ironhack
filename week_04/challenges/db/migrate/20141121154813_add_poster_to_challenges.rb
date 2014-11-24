class AddPosterToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :poster, :string
  end
end
