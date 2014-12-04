class CommentPolicy < ApplicationPolicy

  def create?
    user
  end

  def update?
    user == record.user && not_updated_long_ago
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  protected
  def not_updated_long_ago
    15.minutes >= Time.now - record.updated_at
  end
end
