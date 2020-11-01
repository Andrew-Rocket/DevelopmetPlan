# frozen_string_literal: true

class DepartmentPolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end

  def show?
    user.admin? || user.member?
  end

  def create?
    user.admin?
  end

  alias new? create?

  def edit?
    user.admin?
  end

  alias update? edit?

  def destroy?
    user.admin? && record.users.none?
  end
end
