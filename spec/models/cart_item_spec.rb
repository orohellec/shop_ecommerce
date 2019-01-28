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

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:item) }
  end
end
