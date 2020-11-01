class CommentPolicy < ApplicationPolicy
  def create?
    user.admin? || user.member?
  end
end

