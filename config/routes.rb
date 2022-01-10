Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :users
  root "home#index"
  resources :rental_periods do 
    post :item_returned, on: :member
  end
end

  #get 'home/index'
    #devise_for :accounts