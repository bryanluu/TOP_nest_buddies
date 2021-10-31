class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @users = User.where.not(email: current_user.email)
  end
end
