class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1

  }
end

def shipping_cost
  800
end

def total_item_price
  cart_item.item.price * cart_item.amount.to_i
end

def total_payment
  total_item_price*1.1 + 800.to_i
end

def total_amount
  CartItem.all.sum(:amount)
end