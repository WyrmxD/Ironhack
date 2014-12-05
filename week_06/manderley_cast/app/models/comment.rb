class Comment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates_presence_of :body
  validates_length_of :body, maximum: 500
  validates_presence_of :movie
  
  def author_display_name
    self.user.username
  end
end
