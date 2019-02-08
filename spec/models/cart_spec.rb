# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("created")
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Model instantiation' do
    let(:cart) { described_class.create }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:user_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:status).of_type(:integer).with_options(default: "created") }
    end

    describe 'Associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:items) }
    end

    describe 'enums' do
      it { is_expected.to define_enum_for(:status).with(%i[created paid processed]) }
    end
  end

  describe 'total_price' do
    context 'when there is no item on the cart' do
      let(:cart) { described_class.create }

      it 'returns string 0.00' do
        expect(cart.total_price).to eq(0)
      end
    end

    context 'with items on the cart' do
      let(:user) { create(:user) }

      before do
        item1 = FactoryBot.create(:item, original_price: 10)
        item2 = FactoryBot.create(:item, original_price: 30)
        user.current_cart.add_product(item1)
        user.current_cart.add_product(item2)
      end

      it 'returns string 40' do
        expect(user.current_cart.total_price).to eq(40)
      end
    end
  end

  describe "add_product" do
    context 'when this product is not yet in cart' do
      let(:cart) { create(:cart) }

      before do
        item = FactoryBot.create(:item)
        cart.add_product(item)
      end

      it 'creates new cart_item' do
        expect(cart.cart_items.count).to eq(1)
      end
    end

    context "when the product is already in cart" do
      let(:cart) { create(:cart) }

      it "updates quantity" do
        item = FactoryBot.create(:item)
        cart.add_product(item)
        cart.add_product(item)
        expect(cart.cart_items.find_by(item_id: item.id).quantity).to eq(2)
      end
    end
  end
end
