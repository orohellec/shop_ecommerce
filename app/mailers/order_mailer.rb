# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: "thpnextfever@gmail.com"

  def user_order_email(user)
    @user = user
    # @order = order
    mail(to: user.email,
         subject: "Thanks for your order!")
  end

  def admin_order_email(user)
    @user = user
    # @order = order
    mail(to: "thpnextfever@gmail.com",
         subject: "An order has been placed")
  end
end
