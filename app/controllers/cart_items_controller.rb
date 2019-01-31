# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:id])
    current_user.current_cart.add_product(item)

    if current_user.current_cart.save
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
    @cart_item.quantity = params[:quantity]
    if @cart_item.quantity.zero?
      @cart_item.destroy.save
    elsif !@cart_item.quantity.nil?
      @cart_item.save
    end
    redirect_to cart_path
  end
end
