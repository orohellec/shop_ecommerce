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
end
