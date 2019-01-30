# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_product(item)
    current_item = cart_items.find_by(item_id: item.id)
    if current_item
      current_item.increment(:quantity).save
    else
      current_item = cart_items.create(item_id: item.id)
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum { |i| i.quantity * i.item.original_price }
  end

  def checkout
    update(status: 1)
    create_cart
  end
end
