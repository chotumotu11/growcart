Rails.application.routes.draw do

  resources :brands , only: [:index , :edit, :update ,:new ,:create , :destroy]
  resources :subcategories, only: [:new ,:index,:edit,:update,:create , :destroy]
  resources :admin , only: [:index , :edit ,:update]
  resources :categories , only: [:new,:create,:edit,:update,:destroy]
  resources :users
  resources :items
  resources :carts
  root 'items#index'

  resources :sessions , only: [:new , :create , :destroy]
  get "/login" => "sessions#new" , as: "login"
  delete "/logout" => "sessions#destroy" , as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
