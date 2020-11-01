# frozen_string_literal: true

class HomePolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end
end
