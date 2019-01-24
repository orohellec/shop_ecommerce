# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders, dependent: :destroy
  has_many :items, through: :item_orders
end
