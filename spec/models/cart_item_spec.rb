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
  describe 'Factory' do
    it "has a valid factory" do
      expect(build(:cart_item)).to be_valid
    end
  end

  describe 'Model instantiation' do
    subject(:new_cart_item) { described_class.create }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:cart_id).of_type(:integer) }
      it { is_expected.to have_db_column(:item_id).of_type(:integer) }
      it { is_expected.to have_db_column(:quantity).of_type(:integer).with_options(default: 1) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end

    describe 'Associations' do
      it { is_expected.to belong_to(:cart) }
      it { is_expected.to belong_to(:item) }
    end
  end

  describe 'Methods' do
    describe 'subtotal' do
      item = FactoryBot.create(:item, original_price: 10)
      cart_item = FactoryBot.create(:cart_item, item: item, quantity: 2)
      it "result expected" do
        expect(cart_item.subtotal).to eq(20)
      end
    end
  end
end

CartItem.delete_all
