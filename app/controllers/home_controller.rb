# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @plans = current_user.department.plans
  end
end
