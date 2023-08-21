class Menu < ApplicationRecord

  belongs_to :store
  has_one_attached :menu_image

  validates :name, presence: true
  validates :price, presence: true

  # メニュー画像に関する実装
  # 画像の中身が空であるか判別
  def get_menu_image(size)
    unless menu_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      menu_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end

    # 画像のサイズ調整
    if !size.empty?
      menu_image.variant(resize: size).processed
    else
      menu_image
    end
  end

end
