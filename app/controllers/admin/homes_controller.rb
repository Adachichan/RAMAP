class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    # topページにおいて、データの送信先を判断
    if params[:user_id]
      @user = User.find(params[:user_id])
      all_store = @user.stores
      # top画面(admin)のflag
      @top_screen_flag = 1
    else
      all_store = Store.all
      # top画面(admin)のflag
      @top_screen_flag = 0
    end

    @stores = all_store
  end

end
