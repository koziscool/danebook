class CommentsController < ApplicationController

  def create
    # params_id = "#{params[:commentable]}_id".downcase.to_sym
    # parent = params[:commentable].constantize.find(params[params_id])
    # @comment = Comment.create(author_id: current_user.id, body: params[:body])

    @comment = current_user.comments.build( comments_params )
    respond_to do |format|
      if @comment.save 
        format.html{ redirect_to :back }
        format.js 
      else
        format.html
        format.js
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end

  def comments_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body )
  end

end
