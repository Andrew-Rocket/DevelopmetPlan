# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def index?
    user.admin? || user.member?
  end

  def show?
    user.admin? || user.member?
  end

  def create?
    user.admin?
  end

  alias new? create?

  def edit?
    user.admin?
  end

  alias update? edit?

  def destroy?
    user.admin?
  end

  def export_as_pdf?
    user.admin?
  end
end
