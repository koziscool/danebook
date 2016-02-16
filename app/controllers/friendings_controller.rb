class FriendingsController < ApplicationController

  before_action :require_login, only: [:create, :destroy]
  # before_action :require_current_user, only: [:create, :destroy]

  def create
    current_user.friedings_initiated.build(initiator_id: current_user.id, 
      initiator_id: params[:id] )
  end

  def destroy
    post = Post.find(params[:id])
    current_user.posts.destroy(post)
    redirect_to user_timeline_path(@current_user)
  end



end
