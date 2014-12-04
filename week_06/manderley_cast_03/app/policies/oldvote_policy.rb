class OldvotePolicy < ApplicationPolicy
  
  def save?
  	user
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
