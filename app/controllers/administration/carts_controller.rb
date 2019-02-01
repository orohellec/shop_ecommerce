# frozen_string_literal: true

module Administration
  class CartsController < AdministrationController
    before_action :authenticate_admin!

    def index
      @carts = Cart.all.where(status: 1).or(Cart.all.where(status: 2))
    end

    def show
      @cart = Cart.find(params[:id])
      @items = @cart.items
      @cart_item = CartItem.all.where(cart_id: @cart.id)
    end

    def update
      @cart = Cart.find(params[:id])
      @cart.update(status: params[:status])
      @cart.save
      redirect_to administration_carts_path
    end

    def destroy
      @cart = Cart.find(params[:id])
      @cart.destroy
      redirect_to administration_carts_path
    end
  end
end
