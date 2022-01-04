Rails.application.routes.draw do
  devise_for :accounts
  resources :items
  resources :users
  root "home#index"
end

  #get 'home/index'