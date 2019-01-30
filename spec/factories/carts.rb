# frozen_string_literal: true
# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#

FactoryBot.define do
  factory :cart do
  end
end
