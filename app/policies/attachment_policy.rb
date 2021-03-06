class AttachmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      else
        scope.where(id: user.id)
      end

    end
  end

  def create?
    user.mitglied? || user.admin? || user.super_admin?
  end
end
