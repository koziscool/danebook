class PostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  # before_action :require_current_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(body: params[:body])

    if @post.save
      flash[:success] = "You created a post"
    else
      flash[:error] = "Failed to create post: " + 
        @post.errors.full_messages.join(", ")
    end
    redirect_to user_timeline_path(@current_user)
  end

  def destroy
    post = Post.find(params[:id])
    current_user.posts.destroy(post)
    redirect_to user_timeline_path(@current_user)
  end


end
