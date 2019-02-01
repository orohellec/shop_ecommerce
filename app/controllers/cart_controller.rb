# frozen_string_literal: true

class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    return unless current_user.current_cart.nil?

    current_user.create_cart
  end
end
