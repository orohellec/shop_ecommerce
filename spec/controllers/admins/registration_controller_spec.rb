# frozen_string_literal: true

require 'rails_helper'

module Admins
  RSpec.describe RegistrationsController, type: :controller do
    before { @request.env["devise.mapping"] = Devise.mappings[:admin] }

    describe "visitor can't sign_up" do
      it "return http found" do
        get :new
        expect(response).to have_http_status(:found)
      end

      it "redirect_to" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end
end
