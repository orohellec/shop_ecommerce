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
      if @cart.status == 1
        @cart.save
        flash[:notice] = "Commande mise à jour comme non traitée"
      elsif @cart.status == 2
        flash[:notice] = "Commande mise à jour comme traitée"
      end
      redirect_to administration_carts_path
    end

    def destroy
      @cart = Cart.find(params[:id])
      @cart.destroy
      flash[:notice] = "Commande supprimée"
      redirect_to administration_carts_path
    end
  end
end
