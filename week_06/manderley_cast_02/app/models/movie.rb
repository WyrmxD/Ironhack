class Movie < ActiveRecord::Base

    has_many :comments
    has_many :casts
    has_many :people, through: :casts

    has_many :votes
    has_many  :likes,
              ->() { likes },
              class_name: 'Vote'
    has_many  :dislikes,
              ->() { dislikes },
              class_name: 'Vote'

    
    validates_presence_of :title
    validates_uniqueness_of :title

end
