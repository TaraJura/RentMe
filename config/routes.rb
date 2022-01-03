Rails.application.routes.draw do
  resources :items
  resources :users
  root "users#index"
end

  #get 'home/index'