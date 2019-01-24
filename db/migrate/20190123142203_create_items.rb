# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :original_price
      t.boolean :has_discount, default: false
      t.string :image_url

      t.timestamps
    end
  end
end
