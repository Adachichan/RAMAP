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

end
