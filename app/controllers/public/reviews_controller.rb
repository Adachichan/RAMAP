class Public::ReviewsController < ApplicationController

  before_action :identify_review, only: [:show]

  def new
    @store = Store.find(params[:store_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.store_id = params[:store_id]
    @review.user_id = current_user.id
    @review.name = current_user.name
    @review.nickname = current_user.nickname

    # 口コミの保存可否
    if @review.save
      redirect_to store_review_path(@review.store_id, @review.id)
    else
      @store = Store.find(params[:store_id])
      render :new
    end

  end

  def index
    @store = Store.find(params[:store_id])
    @reviews = @store.reviews
  end

  def show
    @comment = Comment.new
    @comments = @review.comments
  end

  def history
  end

  private

  def review_params
    params.require(:review).permit(:visit_date, :title, :content, :score, :review_image)
  end

  def identify_review
    @review = Review.find(params[:id])
  end

end
