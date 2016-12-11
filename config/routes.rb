Rails.application.routes.draw do
  namespace :api do
    get 'articles/', to: 'articles#show', as: :article
    resources :votes, only: [:create]
    resources :users, only: [:create, :index]
  end

  devise_for :users
end
