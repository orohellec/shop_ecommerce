# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :create_cart

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def create_cart
    Cart.create(user: self)
  end

  # Status column can have 3 states:
  # 0: Current user cart
  # 1: Paid order, waiting admin confirmation
  # 2: Closed order, paid by user and shipped by admin
  def current_cart
    carts.find_by(status: "created")
  end

  def checkout
    current_cart.update(status: "paid")
    create_cart
  end

  def close_order(id)
    carts.find(id).update(status: "processed")
  end
end
