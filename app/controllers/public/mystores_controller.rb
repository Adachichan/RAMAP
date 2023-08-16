class Public::MystoresController < ApplicationController

  before_action :authenticate_user!

  def new
    @mystore = Store.new
    @mystore.opening_hours.build
  end

  def index
  end

  def show
  end

  def edit
  end

  def closing_confirm
  end
end
