class HomeController < ApplicationController
  def index
    @users = User.where.not(email: current_user.email)
  end
end
