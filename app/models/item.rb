# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id             :bigint(8)        not null, primary key
#  title          :string           not null
#  description    :text
#  original_price :decimal(, )
#  has_discount   :boolean          default(FALSE)
#  image_url      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Item < ApplicationRecord
  validates :title, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :item_orders, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :orders, through: :item_orders
  has_one_attached :picture
end
