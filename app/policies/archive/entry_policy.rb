class Archive::EntryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user || user.admin? || user.super_admin?
  end
end
