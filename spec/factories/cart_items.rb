# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint(8)        not null, primary key
#  cart_id    :bigint(8)
#  item_id    :bigint(8)
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cart_item do
    cart
    item
    quantity { rand(1..5) }
  end
end
