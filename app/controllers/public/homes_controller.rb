class Public::HomesController < ApplicationController

  def top
    # 閉店した店舗は取り出し対象外
    @stores = Store.where(is_closed: false)
    @stores_json = @stores.map{|o| { id: o.id, lat: o.latitude, lng: o.longitude, name: o.name } }.to_json
  end

  def search
    @search_store_params = search_store_params
    @search_stores = Store.search_for(@search_store_params)
    @search_stores_json = @search_stores.map{|o| { id: o.id, lat: o.latitude, lng: o.longitude, name: o.name } }.to_json
  end

  private

  def search_store_params
    params.require(:search).permit(:prefecture, :budget, :visit_time)
  end

end
