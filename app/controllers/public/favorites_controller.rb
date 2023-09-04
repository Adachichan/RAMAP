class Public::FavoritesController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: review.id)

    # 口コミの保存可否
    if favorite.save
      redirect_back(fallback_location: store_review_path(review.store_id, review.id))
    else
      redirect_back(fallback_location: store_review_path(review.store_id, review.id))
    end

  end

  def destroy
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: review.id)
    favorite.destroy
    redirect_back(fallback_location: store_review_path(review.store_id, review.id))
  end

end
