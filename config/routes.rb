Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only:[:create]
  # resources :locations, only:[:create]
  # resources :restaurantms, only:[:create]
  post "users/signup" => "users#create"
  post "users/login" => "users#login"
  post "users/delete" => "users#delete"
  get "users/profile" => "users#profile"
  post "locations/create" => "location#create"
  post "locations/delete" => "location#delete"
  get "locations/show" => "location#show"
  get "locations/list" => "location#list"
  post "restaurants/create" => "restaurantms#create"
  post "restaurants/delete" => "restaurantms#delete"
  get "restaurants/get" => "restaurantms#get"
  get "restaurants/list" => "restaurantms#list"
end
