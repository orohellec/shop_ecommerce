# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe "POST #create" do
    let(:stripe_helper) { StripeMock.create_test_helper }

    before do
      @user = create(:user)
      sign_in @user
      @item = create(:item)
      @user.current_cart.add_product(@item)
      @customer = Stripe::Customer.create(email: @user.email, source: stripe_helper.generate_card_token)
    end

    it "creates a stripe customer" do
      expect(@customer.email).to eq(@user.email)
    end

    it "change status to checkout" do
      get :create
      expect(@user.carts.first.status).to eq("paid")
    end

    it "creates a new cart" do
      get :create
      expect(@user.current_cart.status).to eq("created")
    end

    it "mocks a declined card error" do
      get :create
      StripeMock.prepare_card_error(:card_declined)
      expect { Stripe::Charge.create(amount: 1, currency: 'usd') }.to raise_error { |e|
                                                                        expect(e).to be_a Stripe::CardError
                                                                        expect(e.http_status).to eq(402)
                                                                        expect(e.code).to eq('card_declined')
                                                                      }
    end
  end
end
