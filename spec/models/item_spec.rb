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
  it "is valid with valid attributes"
  it "is not valid without a title"
  it "is valid without a description"
end
