# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  title               :string           not null
#  description         :text
#  original_price      :decimal(, )
#  has_discount        :boolean          default(FALSE)
#  image_url           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  discount_percentage :integer          default(0)
#

require 'factory_bot_rails'
require 'faker'

FactoryBot.define do
  factory :item do
    title { Faker::Pokemon.name }
    description { Faker::Shakespeare.romeo_and_juliet_quote }
    original_price { Faker::Number.decimal(2) }
    has_discount { Faker::Boolean.boolean }
    discount_percentage { rand(100) }

    trait :with_discount do
      has_discount { true }
    end

    trait :without_discount do
      has_discount { false }
    end

    factory :item_with_discount, traits: %i[with_discount]
    factory :item_without_discount, traits: %i[without_discount]
  end
end
