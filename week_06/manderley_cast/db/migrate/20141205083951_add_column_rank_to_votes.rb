class AddColumnRankToVotes < ActiveRecord::Migration
  
  def up
  	add_column :votes, :rank, :integer, default: 0
  	Vote.all.each do | vote |
  		if vote.points  == 1 
  			vote.rank.liked!
  		elsif vote.points == -1
  			vote.rank.disliked!
  		end
  	end
  	remove_column :votes, :points

  end

  def down
  	add_column :votes, :points, :integer, default: 0
  	Vote.all.each do | vote |
  		if vote.rank.liked?
  			vote.points = 1
  		elsif vote.rank.disliked?
  			vote.points = -1
  		end
  	end
  	remove_column :votes, :rank
  end

end
