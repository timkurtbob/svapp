class CirclePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.present?
  end

  def create?
    user.mitglied? || user.admin? || user.super_admin?
  end

  def update?
    record.user == user  && (user.mitglied? || user.admin? || user.super_admin?)
  end
end
