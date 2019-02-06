# frozen_string_literal: true

class ChargesController < ApplicationController
  def new
    @price = current_user.current_cart.total_price
    # Amount in cents
    @amount = (@price * 100).to_i
  end

  def create
    @price = current_user.current_cart.total_price
    # Amount in cents
    @amount = (@price * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    _charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    # Validate current cart and create a new empty one
    current_user.checkout
    # Deliver the signup email
    OrderMailer.user_order_email(current_user).deliver
    OrderMailer.admin_order_email(current_user).deliver
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
