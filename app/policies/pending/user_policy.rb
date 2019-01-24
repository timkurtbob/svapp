class Pending::UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      end
    end
  end

  def update?
    user.admin? || user.super_admin?
  end
end
