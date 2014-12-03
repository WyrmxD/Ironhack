class MoviePolicy < ApplicationPolicy
	
	def index?
		true
	end

	def show?
		true
	end

	def create?
		user.try(:admin?) || user.try(:yoda?)
	end

	def update?
		user.try(:admin?) || user.try(:yoda?)
	end

	def destroy?
		user.try(:yoda?) && record.comments.empty?
	end

	class Scope < Scope
		def resolve
		  scope
		end
	end
end
