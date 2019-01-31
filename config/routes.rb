# frozen_string_literal: true

Rails.application.routes.draw do
  # need to be securize later (only available for admin)
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    unlocks: 'admins/unlocks'
  }
  devise_for :users, path: '', path_names: { edit: '/account' }, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/cart', to: 'cart#show'
  resources :items, only: %i[index show]
  resources :cart_items, only: %i[create update destroy]
  namespace 'administration' do
    resources :items
  end
  resources :charges # Stripe
end
