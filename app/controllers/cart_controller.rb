# frozen_string_literal: true

class CartController < ApplicationController
  before_action :authenticate_user!

  def show; end
end
