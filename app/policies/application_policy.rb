class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.is_a?(Array) ? record.last : record
  end


  def index?
    user.admin? || user.super_admin?
  end

  def show?
    user.admin? || user.super_admin?
  end

  def create?
    user.admin? || user.super_admin?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.super_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.super_admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
