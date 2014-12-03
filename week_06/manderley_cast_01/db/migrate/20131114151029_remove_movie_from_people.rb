class RemoveMovieFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :movie_id
  end
end
