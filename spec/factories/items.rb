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

FactoryBot.define do
  factory :item do
  end
end
