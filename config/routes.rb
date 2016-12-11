Rails.application.routes.draw do
  namespace :api do
    get 'articles/', to: 'articles#show', as: :article
    resources :votes,    only: [:create]
  end

  devise_for :users
end
