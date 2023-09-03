class Review < ApplicationRecord

  belongs_to :user
  belongs_to :store
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :review_image

  validates :visit_date, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :score, presence: true

  # 口コミ画像に関する実装
  # 画像の中身が空であるか判別
  def get_review_image(size)
    unless review_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      review_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end

    # 画像のサイズ調整
    if !size.empty?
      review_image.variant(resize: size).processed
    else
      review_image
    end
  end

end