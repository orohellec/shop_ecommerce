# frozen_string_literal: true

class CreateItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :item_orders do |t|
      t.references :order
      t.references :item
      t.integer :quantity

      t.timestamps
    end
  end
end
