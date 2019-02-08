# frozen_string_literal: true

require 'rails_helper'
module Administration
  RSpec.describe ItemsController, type: :controller do
    describe "visitor access forbidden" do
      it { expect(get(:index)).to have_http_status(:found) }
      it { expect(get(:new)).to have_http_status(:found) }
    end

    describe "user access forbidden" do
      before { sign_in FactoryBot.create(:user) }

      it { expect(get(:index)).to have_http_status(:found) }
      it { expect(get(:new)).to have_http_status(:found) }
    end

    describe "admin access" do
      before { sign_in FactoryBot.create(:admin) }

      it { expect(get(:index)).to have_http_status(:success) }
      it { expect(get(:new)).to have_http_status(:success) }
    end
  end
end
