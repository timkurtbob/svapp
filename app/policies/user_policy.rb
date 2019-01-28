class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      else
        scope.where(id: user.id)
      end

    end
  end

  def index?
    user.admin? || user.super_admin?
  end

  def show?
    record == user|| user.admin? || user.super_admin?
  end

  def update?
    record == user || user.admin? || user.super_admin?
  end
end
