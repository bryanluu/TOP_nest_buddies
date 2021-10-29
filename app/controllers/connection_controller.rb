class ConnectionController < ApplicationController
  def create
    @invite = Connection.create(user_id: current_user.id, buddy_id: connection_params[:buddy_id])

    redirect_to root_path
  end

  #######
  private
  #######

  def connection_params
    params.permit(:buddy_id)
  end
end
