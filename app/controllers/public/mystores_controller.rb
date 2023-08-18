class Public::MystoresController < ApplicationController

  before_action :authenticate_user!
  before_action :identify_store, only: [:show, :edit, :update]


  def new
    @mystore = Store.new
    @mystore.opening_hours.build
  end

  def create
    @mystore = Store.new(store_params)
    @mystore.user_id = current_user.id
    # 緯度経度情報の保存は一旦保留。(仮の値”0”を代入)
    # geocoderを使う場合 → createアクション、Google APIを使う場合 → newアクション
    @mystore.latitude = 0
    @mystore.longitude = 0
    # 店舗情報の保存可否
    if @mystore.save
      redirect_to mystore_path(@mystore.id)
    else
      @mystore.opening_hours.build
      render :new
    end
  end

  def index
    @mystores = current_user.stores
    # Noの初期値
    @number = 1
  end

  def show
  end

  def edit
    
  end

  def closing_confirm
  end

  private

  def store_params
    # opening_hours_attributesが子のモデルに保存する要素
    # :id、:_destroyをつけることで、編集および削除が可能になる
    params.require(:store).permit(
      :name, :name_kana, :postal_code, :prefecture, :address, :building_and_apartment,
      :telephone_number, :fax_number, :store_image, :store_genre_id, :lowest_price_range,
      :highest_price_range, :closest_station,:representative, :representative_kana,
      :representative_email, :note, :staff, :staff_telephone_number, :staff_email,
      day_ids: [],
      opening_hours_attributes: [:id, :opening_time, :closing_time, :_destroy])
  end

  def identify_store
    @mystore = Store.find(params[:id])
  end

end
