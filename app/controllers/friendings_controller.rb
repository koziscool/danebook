class FriendingsController < ApplicationController

  before_action :require_login, only: [:create, :destroy]
  # before_action :require_current_user, only: [:create, :destroy]

  def create
    current_user.friendings_initiated.build(initiator_id: current_user.id, 
      recipient_id: params[:user_id] )
    friended_user = User.find( params[:user_id] )
    redirect_to user_timeline_path( friended_user )
  end

  def destroy
    unfriended_user = User.find( params[:id] )
    current_user.friends_initiated.delete(unfriended_user)
    flash[:success] = "Successfully unfriended"
    render :back
  end

end
