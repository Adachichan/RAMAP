class Store < ApplicationRecord

  has_many :regular_holidays, dependent: :destroy
  has_many :days, through: :regular_holidays
  belongs_to :store_genre

end
