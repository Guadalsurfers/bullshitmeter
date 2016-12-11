Rails.application.routes.draw do
  namespace :api do
    resources :votes, only: [:create]
    resources :users, only: [:create]
  end

  devise_for :users
end
