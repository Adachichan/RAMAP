class Public::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.review_id = review.id
    comment.poster = current_user.name

    # コメントの保存可否
    if comment.save
      redirect_back(fallback_location: store_review_path(review.store_id, review.id))
    else
      redirect_back(fallback_location: store_review_path(review.store_id, review.id))
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
