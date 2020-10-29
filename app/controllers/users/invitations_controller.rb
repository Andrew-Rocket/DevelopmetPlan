class Users::InvitationsController < Devise::InvitationsController
  before_action :authorize_user

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def authorize_user
    authorize User
  end
end

