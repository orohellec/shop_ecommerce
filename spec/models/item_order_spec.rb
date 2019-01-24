# frozen_string_literal: true

# == Schema Information
#
# Table name: item_orders
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)
#  item_id    :bigint(8)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
