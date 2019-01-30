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

FactoryBot.define do
  factory :cart do
    user

    # cart_with_items will create item data after the cart has been created
    factory :cart_with_items do
      # items_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        items_count { 5 }
      end

      # the after(:create) yields two values; the cart instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the cart is associated properly to the item
      after(:create) do |cart, evaluator|
        create_list(:item, evaluator.items_count, cart: cart)
      end
    end
  end
end
