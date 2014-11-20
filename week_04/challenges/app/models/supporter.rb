class Supporter < ActiveRecord::Base
	belongs_to :challenge
	validates :email, {format: { with: /@/ , message: "Not a valid email" }, uniqueness: { scope: :challenge} }
end
