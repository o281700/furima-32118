class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to item_path(comment.item.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user, item_id: params[:item_id])
  end
end
