# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    if !user_signed_in?
      redirect_to new_user_registration_path
      flash[:alert] = "Vous devez être connecté pour ajouter des articles à votre panier"
    else
      item = Item.find(params[:id])
      current_user.current_cart.add_product(item)

      if current_user.current_cart.save
        flash[:notice] = "#{item.title} ajouté au panier"
        redirect_to cart_path
      else
        flash[:alert] = "Nous avons eu un problème pour ajouter ce produit à votre panier"
        redirect_to @product
      end
    end
  end

  def destroy
    CartItem.find(params[:id]).destroy
    flash[:notice] = "Produit supprimé du panier"
    redirect_to cart_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = params[:quantity]
    if !@cart_item.quantity.nil?
      if @cart_item.quantity.zero?
        @cart_item.destroy.save
        flash[:notice] = "Produit supprimé du panier"
      elsif !@cart_item.quantity.nil?
        @cart_item.save
        flash[:notice] = "Quantité changée à #{@cart_item.quantity}"
      end
    end
    redirect_to cart_path
  end
end
