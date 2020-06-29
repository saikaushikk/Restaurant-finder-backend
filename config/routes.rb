Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only:[:create]
  post "user/signup" => "users#create"
  post "user/login" => "users#login"
  post "user/delete" => "users#delete"
  get "user/profile" => "users#profile"
  post "/location/create" => "location#create"
  post "/location/delete" => "location#delete"
  get "/location/show" => "location#show"
  get "/location/list" => "location#list"
end
