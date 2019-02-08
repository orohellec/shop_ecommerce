# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  describe "POST #create" do
    it "redirects to sign up for visitors" do
      get :create
      expect(response).to redirect_to(new_user_registration_path)
    end

    it "redirects to cart if signed in" do
      user = create(:user)
      sign_in user
      item = create(:item)
      get :create, params: { id: item.id }
      expect(response).to redirect_to(cart_path)
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = create(:user)
      sign_in @user
      @item = create(:item)
      @user.current_cart.add_product(@item)
    end

    it "redirects to cart" do
      get :destroy, params: { id: CartItem.find_by(item_id: @item.id) }
      expect(response).to redirect_to(cart_path)
    end

    it "destroy cart_item" do
      get :destroy, params: { id: CartItem.find_by(item_id: @item.id) }
      expect(@user.current_cart.items.include?(@item)).to eq(false)
    end
  end
end
