class Public::MymenusController < ApplicationController

  before_action :authenticate_user!
  before_action :identify_mymenu, only: [:edit, :update, :destroy]

  def index
    @mystore = Store.find(params[:mystore_id])
    @mymenu = Menu.new
    # 店舗ごとの全メニューを取得
    @mymenus = @mystore.menus.all
    @number = 1
  end

  def create
    @mystore = Store.find(params[:mystore_id])
    @mymenu = Menu.new(mymenu_params)
    @mymenu.store_id = params[:mystore_id]
    # 店舗ジャンルの保存可否
    if @mymenu.save
      redirect_to mystore_mymenus_path(@mystore.id)
    else
      @mymenus = Menu.where(store_id:params[:mystore_id])
      render :index
    end
  end

  def edit
  end

  def update
    # メニュー情報の更新可否
    if @mymenu.update(mymenu_params)
      redirect_to mystore_mymenus_path(@mystore.id)
    else
      render :edit
    end
  end

  def destroy
    if @mymenu
      @mymenu.destroy
    end
    redirect_to mystore_mymenus_path(@mystore.id)
  end

  def destroy_all
    @mystore = Store.find(params[:mystore_id])
    @mystore.menus.destroy_all
    redirect_to mystore_mymenus_path(@mystore.id)
  end

  private

  def mymenu_params
    params.require(:menu).permit(:menu_image, :name, :price)
  end

  def identify_mymenu
    @mystore = Store.find(params[:mystore_id])
    @mymenu = Menu.find(params[:id])
  end

end
