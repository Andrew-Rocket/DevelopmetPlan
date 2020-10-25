class TaskPolicy < ApplicationPolicy

  def create?
    user.admin?
  end

  alias new? create?
end
