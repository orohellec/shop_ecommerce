# frozen_string_literal: true

module Administration
  class CartsController < AdministrationController
    before_action :authenticate_admin!

    def index
      @carts = Cart.all.where(status: 1).or(Cart.all.where(status: 2))
    end

    def show
      @cart = Cart.find(params[:id])
      @items = @cart.cart_items
    end

    def update
      @cart = Cart.find(params[:id])
      if @cart.status == 1
        @cart.update(status: 2)
        @cart.save
        flash[:notice] = "Commande mise à jour comme traitée"
      elsif @cart.status == 2
        @cart.update(status: 1)
        flash[:notice] = "Commande mise à jour comme non traitée"
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
