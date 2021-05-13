class Item < ApplicationRecord
  attachment :image
  enum is_active: {販売中: true, 販売停止中: false}
  belongs_to :genre, optional:true
  has_many :cart_items, dependent: :destroy
end

