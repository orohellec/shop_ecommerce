# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :item_orders, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :orders, through: :item_orders
  has_one_attached :picture
end
