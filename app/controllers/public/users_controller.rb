class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_current_user

  def show
  end

  def edit
  end

  def update
    # user情報の更新可否
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :name_kana, :nickname, :postal_code, :address, :sex, :telephone_number)
  end

end
