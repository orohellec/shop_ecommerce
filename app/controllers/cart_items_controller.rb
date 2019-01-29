# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:id])
    current_user.cart.add_product(item)

    if current_user.cart.save
      redirect_to cart_path(params[:id])
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @product
    end
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path
  end
end
