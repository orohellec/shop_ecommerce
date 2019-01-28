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

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Model instantiation' do
    subject(:new_item) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:original_price).of_type(:decimal) }
      it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:discount_percentage).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end

    describe 'Associations' do
      it { is_expected.to have_many(:cart_items) }
      it { is_expected.to have_many(:item_orders) }
      it { is_expected.to have_many(:carts) }
      it { is_expected.to have_many(:orders) }
    end
  end

  # it "is valid with valid attributes" do
  #   item.title = "Anything"
  #   item.description = "Anything"
  #   item.original_price = 50
  #   expect(item).to be_valid
  # end
  # it "is not valid without a title" do
  #   item.title = nil
  #   expect(item).not_to be_valid
  # end
  # it "is valid without a description" do
  #   item.title = "Anything"
  #   item.description = nil
  #   expect(item).to be_valid
  # end
  # it "is valid without an original_price" do
  #   item.title = "Anything"
  #   item.original_price = nil
  #   expect(item).to be_valid
  # end
end
