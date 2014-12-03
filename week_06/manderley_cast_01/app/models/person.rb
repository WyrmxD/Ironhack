class Person < ActiveRecord::Base
  has_many :casts
  has_many :movies, through: :casts

  validates_presence_of :first_name, :last_name

  def complete_name
  	"#{self.first_name} #{self.last_name}"
  end
end
