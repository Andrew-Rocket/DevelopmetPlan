# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  alias new? create?

  def update?
    user.admin?
  end

  alias edit? update?

  def show?
    true
  end

  def destroy?
    user.admin?
  end
end
