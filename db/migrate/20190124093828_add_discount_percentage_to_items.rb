# frozen_string_literal: true

class AddDiscountPercentageToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :discount_percentage, :integer, default: 0
  end
end
