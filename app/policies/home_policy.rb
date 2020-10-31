class DepartmentPolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end
end
