
class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end

  def show?
    user.admin? || user.member?
  end

  def edit?
    ( user.admin? || user.member? ) && user == record
  end

  alias update? edit?

  def new?
    user.admin?
  end

  alias invite? new?


end