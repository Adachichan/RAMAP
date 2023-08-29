class Public::StoresController < ApplicationController

  def show
    @store = Store.find(params[:id])
    @menus = @store.menus
  end

end
