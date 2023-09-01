class Public::MenusController < ApplicationController

  def index
    @store = Store.find(params[:store_id])
    @menus = @store.menus
  end

end
