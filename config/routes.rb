require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => ENV['SIDEKIQ_URL'] || '/sidekiq'

  root to: 'home#index'
  resources :subscriptors, only: [:create]

  namespace :api do
    get 'articles/', to: 'articles#show', as: :article
    resources :votes, only: [:create]
    resources :users, only: [:create, :index]
  end

  devise_for :users
end
