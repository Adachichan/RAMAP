class Comment < ApplicationRecord

  belongs_to :review

  validates :poster, presence: true
  validates :store, presence: true
  validates :content, presence: true

end
