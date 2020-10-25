class FlowStepPolicy < ApplicationPolicy

  def create?
    user.admin?
  end

end
