class Admin::ReviewsController < ApplicationController

  before_action :identify_review, only: [:show, :destroy]

  def index
    # indexページの表示画面を判別
    if params[:user_id]
      @user = User.find(params[:user_id])
      all_review = @user.reviews
      # index画面(admin)のflag
      @index_screen_flag = 1

    elsif params[:store_id]
      @store = Store.find(params[:store_id])
      all_review = @store.reviews
      # index画面(admin)のflag
      @index_screen_flag = 2

    else
      all_review = Review.all
      # index画面(admin)のflag
      @index_screen_flag = 0
    end

    @reviews = all_review.page(params[:page]).per(10)

  end

  def show
  end

  def destroy
    if @review
      @review.destroy
    end
    redirect_to admin_reviews_path
  end

  private

  def identify_review
    @review = Review.find(params[:id])
  end

end
