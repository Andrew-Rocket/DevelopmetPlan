class DepartmentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def new?
    user.admin?
  end

  alias create? new?

  def edit?
    user.admin?
  end

  alias edit? update?

  def update?
    user.admin?
  end

  def destroy?
    user.admin? && record.users.none?
  end
end