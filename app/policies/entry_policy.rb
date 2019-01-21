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
    user.present?
  end

  def update?
    user.present?
  end

  def bookmark?
    user.present?
  end

  def bee?
    user.present?
  end

  def add_comment?
    user.present?
  end

  def deactivate?
    user.present?
  end


  private

  def user_is_moderator?
    @user.role === 'ModeratorIn'
  end
end