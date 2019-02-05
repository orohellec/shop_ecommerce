# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all.where(on_sale: true)
  end

  def show
    @item = Item.find(params[:id])
  end
end
