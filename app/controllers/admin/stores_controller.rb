class Admin::StoresController < ApplicationController

  before_action :authenticate_admin!
  before_action :identify_store, only: [:show, :edit]

  def show
  end

  def edit
  end

  def change_confirm
  end

  private

  def identify_store
    @store = Store.find(params[:id])
  end

end
