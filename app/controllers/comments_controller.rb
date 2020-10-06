class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/sounds/#{comment.sound_id}"
  end

  def index
    @comments = Comment.all(order: 'created_at DESC')
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, sound_id: params[:sound_id])
  end
end
