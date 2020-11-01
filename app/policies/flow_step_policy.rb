# frozen_string_literal: true

class FlowStepPolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
