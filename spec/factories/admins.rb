# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'factory_bot_rails'
require 'faker'

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "azerty" }
    password_confirmation { "azerty" }
  end
end
