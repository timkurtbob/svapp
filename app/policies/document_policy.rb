class DocumentPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.present?
  end

  def create?
    user.admin? || user.super_admin?
  end

end
