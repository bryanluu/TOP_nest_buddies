class ConnectionController < ApplicationController
  def create
    @invite = Connection.create(user_id: current_user.id, buddy_id: connection_params[:buddy_id])

    redirect_to root_path
  end

  def accept
    @invite = Connection.find_by(user_id: connection_params[:buddy_id], buddy_id: current_user.id)
    @invite.update(accepted: true)
    @invite.create_inverse

    redirect_to root_path
  end

  #######
  private
  #######

  def connection_params
    params.permit(:buddy_id)
  end
end
