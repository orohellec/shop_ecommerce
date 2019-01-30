# frozen_string_literal: true

class AddColumnToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :status, :integer, default: 0
  end
end
