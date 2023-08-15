class Public::MystoresController < ApplicationController

  before_action :authenticate_user!

  def new
    @mystore = Store.new
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
