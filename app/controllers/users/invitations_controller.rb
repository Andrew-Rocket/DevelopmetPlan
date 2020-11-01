# frozen_string_literal: true

module Users
  class InvitationsController < Devise::InvitationsController
    before_action :authorize_user

    private

    def authorize_user
      authorize User
    end
  end
end
