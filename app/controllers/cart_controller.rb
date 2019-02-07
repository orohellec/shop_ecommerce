# frozen_string_literal: true

class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.create_cart unless current_user.current_cart.nil?
  end
end
