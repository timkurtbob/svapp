class EntryPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.mitglied? || user.admin? || user.super_admin?
  end

  def update?
    record.user == user  && (user.mitglied? || user.admin? || user.super_admin?)

  end

  def bookmark?
    user.mitglied? || user.admin? || user.super_admin?
  end

  def bee?
    user.mitglied? || user.admin? || user.super_admin?
  end

  def add_comment?
    user.mitglied? || user.admin? || user.super_admin?
  end

  def deactivate?
    record.user == user || user.admin? || user.super_admin?
  end

end
