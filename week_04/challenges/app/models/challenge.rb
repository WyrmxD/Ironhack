class Challenge < ActiveRecord::Base
	has_many :supporters
	validates :title , { uniqueness: true, presence: true , length: {maximum: 30} }
	validates :description , { presence: true , length: {minimum: 20 } }

end
