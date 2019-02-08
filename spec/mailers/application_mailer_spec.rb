# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationMailer do
  it "set the delivery_method to test" do
    expect(Rails.application.config.action_mailer.delivery_method).to be :test
  end

  it "set the base delivery_method to test" do
    expect(ActionMailer::Base.delivery_method).to be :test
  end
end
