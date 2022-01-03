Rails.application.routes.draw do
  resources :items
  resources :users
  root "home#index"
end

  #get 'home/index'