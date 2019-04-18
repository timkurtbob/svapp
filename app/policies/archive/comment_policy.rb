class Archive::CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      end
    end
  end

  def update?
    record.user == user || user.admin? || user.super_admin?
  end
end
