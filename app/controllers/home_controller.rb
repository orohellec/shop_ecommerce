# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @items = Item.all
  end
end
