class TaskPolicy < ApplicationPolicy

  def create?
    user.admin?
  end

  alias new? create?

  def update?
    user.admin?
  end

  alias edit? update?

end
