class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 	has_many :comments
	validates :username, uniqueness: true

	devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable, 
		 :confirmable

	enum role: {
		plain: 0,
		admin: 1, 
		yoda:  2
	}

end