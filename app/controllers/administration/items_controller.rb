# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    before_action :authenticate_admin!

    def index
      @items = Item.all.where(on_sale: 1)
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_parameters)
      @item.save
      if @item.save
        flash[:notice] = "Nouvel article créé"
      else
        flash[:alert] = "Vous devez au moins renseigner un titre et un prix"
      end
      redirect_to administration_items_path
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_parameters)
      if @item.save
        flash[:notice] = "L'article a bien été édité"
      else
        flash[:alert] = "Vous devez au moins renseigner un titre et un prix"
      end
      redirect_to administration_items_path
    end

    def update_sales_status
      @item = Item.find(params[:id])
      @item.update(on_sale: 0)
      flash[:notice] = "L'article n'est plus en vente"
      redirect_to administration_items_path
    end

    def show
      @item = Item.find(params[:id])
    end

    private

    def item_parameters
      params.require(:item).permit(
        :image_url,
        :title,
        :description,
        :original_price
      )
    end
  end
end
