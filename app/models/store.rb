class Store < ApplicationRecord

  has_many :menus, dependent: :destroy
  has_many :opening_hours, dependent: :destroy
  has_many :regular_holidays, dependent: :destroy
  has_many :days, through: :regular_holidays
  belongs_to :store_genre
  has_one_attached :store_image

  accepts_nested_attributes_for :opening_hours, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :lowest_price_range, presence: true
  validates :highest_price_range, presence: true
  validates :representative, presence: true
  validates :representative_kana, presence: true
  validates :representative_email, presence: true
  validates :staff, presence: true
  validates :staff_telephone_number, presence: true
  validates :staff_email, presence: true

  enum prefecture: { none_prefecture: 0, hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
  ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14, #/
  niigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20, #/
  gifu: 21, shizuoka: 22, aichi: 23, mie: 24, #/
  shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama:30, #/
  tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35, #/
  tokushima: 36, kagawa: 37, ehime: 38, kochi: 39, #/
  fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47}

  # 店舗画像に関する実装
  # 画像の中身が空であるか判別
  def get_store_image(size)
    unless store_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      store_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end

    # 画像のサイズ調整
    if !size.empty?
      store_image.variant(resize: size).processed
    else
      store_image
    end
  end

end