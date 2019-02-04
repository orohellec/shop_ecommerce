# frozen_string_literal: true

module Administration
  class CartsController < AdministrationController
    before_action :authenticate_admin!

    def index
      @carts = Cart.all.where(status: %i[paid processed])
    end

    def show
      @cart = Cart.find(params[:id])
      @items = @cart.cart_items
    end

    def update
      @cart = Cart.find(params[:id])
      @cart.update(status: params[:status])
      flash[:notice] = if @cart.paid?
                         "Commande mise à jour comme non traitée"
                       else # cart.processed?
                         "Commande mise à jour comme traitée"
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
