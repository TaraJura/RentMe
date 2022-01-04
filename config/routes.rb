Rails.application.routes.draw do
  devise_for :accounts
  resources :items
  resources :users
  root "home#index"
  resources :rental_periods
end

  #get 'home/index'