class CastPolicy < ApplicationPolicy

	def create?
		user.try(:admin?) || user.try(:yoda?)
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
