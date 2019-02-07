# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartController, type: :controller do
  describe "GET #show" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns http success without a cart" do
      user = create(:user)
      sign_in user
      user.carts.delete_all
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns http 209" do
      get :show
      expect(response).to have_http_status(:found)
    end
  end
end
