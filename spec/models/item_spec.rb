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
  subject(item) { Item.new(title: "Anything") }

  it "is valid with valid attributes" do
    item.title = "Anything"
    item.description = "Anything"
    item.original_price = 50
    expect(item).to be_valid
  end
  it "is not valid without a title" do
    item.title = nil
    expect(item).not_to be_valid
  end
  it "is valid without a description" do
    item.title = "Anything"
    item.description = nil
    expect(item).to be_valid
  end
  it "is valid without an original_price" do
    item.title = "Anything"
    item.original_price = nil
    expect(item).to be_valid
  end
end
