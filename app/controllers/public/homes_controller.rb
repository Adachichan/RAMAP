class Public::HomesController < ApplicationController

  def top
    @store = Store.find(1)
  end

  def search
  end
end
