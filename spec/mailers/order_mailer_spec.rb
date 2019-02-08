# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "user_order" do
    let( :user ){ create :user, email: 'test_user@example.com' }
    let( :mail ){ OrderMailer.user_order_email(user) }

    it "got queued" do
      assert_emails 1 do
        mail.deliver_now
      end
    end

    it "is from the good sender" do
      expect(mail.from).to be(["thpnextfever@gmail.com"])
    end

    it "is send to the good adress" do
      expect(mail.to).to be(["test_user@example.com"])
    end

    it "is has the good title" do
      expect(mail.subject).to be("Thanks for your order!")
    end
  end
end
