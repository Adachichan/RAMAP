class Public::HomesController < ApplicationController

  def top
    @stores = Store.all
    @stores_json = @stores.map{|o| { id: o.id, lat: o.latitude, lng: o.longitude, name: o.name } }.to_json
  end

  def search
  end
end
