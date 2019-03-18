Rails.application.routes.draw do
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  root "users#new"
  resources :users
  resources :abc
end
