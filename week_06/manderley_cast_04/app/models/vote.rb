class Vote < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  scope :likes, ->() { where points: 1 }
  scope :dislikes, ->() { where points: -1 }
  scope :user, ->(user) { where user: user }
  scope :movie, ->(movie) { where movie: movie }

  def liked
    self.points = 1
  end

  def liked!
    liked
    save
  end

  def liked?
    self.points == 1 
  end

  def disliked
    self.points = -1
  end

  def disliked!
    disliked
    save
  end

  def disliked?
      self.points == -1
  end

end
