# frozen_string_literal: true

class TaskStatePolicy < ApplicationPolicy
  def update?
    user == record.user
  end
end
