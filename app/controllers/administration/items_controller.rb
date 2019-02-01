# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    before_action :authenticate_admin!

    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_parameters)
      @item.save
      redirect_to administration_items_path
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_parameters)
      redirect_to administration_items_path
    end

    def show
      @item = Item.find(params[:id])
    end

    def destroy
      @item = Item.find(params[:id])
      @item.delete
      redirect_to administration_items_path
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
