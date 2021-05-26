class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1
  }

def shipping_cost
 return 800
end

def total_item_price
  (order_details.sum("price*amount*1.1")).round
end

def total_payment
  (order_details.sum("price*amount*1.1")+shipping_cost).round
end

def total_amounts
  (order_details.sum("amount")).round
end

validates :postal_code, presence: true
validates :address, presence: true
validates :name, presence: true

end

