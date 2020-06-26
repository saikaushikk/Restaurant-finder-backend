Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only:[:create]
  post "/signup" => "users#create"
  post "/login" => "users#login"
  post "/delete" => "users#delete"
  get "/profile" => "users#profile"
end
