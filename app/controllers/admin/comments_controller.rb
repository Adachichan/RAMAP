class Admin::CommentsController < ApplicationController

  def index
    @review = Review.find(params[:review_id])
    @comments = @review.comments
    @number = 1
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      comment.destroy
    end
    redirect_to admin_review_comments_path(comment.review_id)
  end

end
