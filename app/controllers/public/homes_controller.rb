class Public::HomesController < ApplicationController

  def top
    # 閉店した店舗は取り出し対象外
    @stores = Store.where(is_closed: false)
    @stores_json = @stores.map{|o| { id: o.id, lat: o.latitude, lng: o.longitude, name: o.name } }.to_json
  end

  def search
  end
end
