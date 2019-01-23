class Pending::UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user.admin? || user.super_admin?
  end
end
