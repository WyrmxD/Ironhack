class MoviePolicy < ApplicationPolicy
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
