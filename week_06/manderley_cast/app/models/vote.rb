class Vote < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  scope :likes, ->() { liked }
  scope :dislikes, ->() { disliked }
  scope :user, ->(user) { where user: user }
  scope :movie, ->(movie) { where movie: movie }

  enum rank: {  
    liked:    1,
    disliked: -1,
    not_voted: 0
  }

  def liked
    self.rank = :liked
  end

  def disliked
    self.rank = :disliked
  end

end
