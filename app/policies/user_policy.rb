# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end

  def show?
    user.admin? || user.member?
  end

  def edit?
    true
  end

  alias update? edit?

  def new?
    user.admin?
  end

  alias create? new?
end
