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
  describe 'Associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:item) }
  end
end
