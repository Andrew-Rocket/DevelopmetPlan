class TaskStatePolicy < ApplicationPolicy

  def update?
    user == record.user
  end

end
