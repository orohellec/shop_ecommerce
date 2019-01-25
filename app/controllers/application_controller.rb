# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_ressource

  private

  def layout_by_ressource
    if devise_controller? && resource_name == :admin
      "administration"
    else
      "application"
    end
  end
end
