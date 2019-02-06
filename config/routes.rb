# frozen_string_literal: true

Rails.application.routes.draw do
  # need to be securize later (only available for admin)
  require 'sidekiq/web'
  authenticate :admin do
    mount Sidekiq::Web => 'administration/sidekiq'
  end

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
  root 'items#index'
  get '/cart', to: 'cart#show'
  resources :items, only: %i[index show]
  resources :cart_items, only: %i[create update destroy]
  namespace 'administration' do
    resources :items, except: %i[show destroy] do
      member do
        post :update_sales_status
        patch :update_sales_status
        put :update_sales_status
      end
    end
    resources :carts
  end
  resources :charges # Stripe
end
