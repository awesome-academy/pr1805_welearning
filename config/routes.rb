Rails.application.routes.draw do

  root "static_pages#home"
  get "/help" , to: "static_pages#help"
  get "/about" , to: "static_pages#about"
  get "/contact" , to: "static_pages#contact"
  get "/news" , to: "static_pages#news"

  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"

  get "/login" , to: "sessions#new"
  post "/login" , to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: :index
  resources :account_activations, only: :edit
  resources :password_resets, except: :show
  resources :courses, only: :show
  resources :searches, only: :index

  namespace :admin do
    root "dashboards#index"

    resources :users, only: [:index, :edit, :update, :destroy]
    scope shallow_prefix: "sname" do
      resources :courses do
        resources :lessons, shallow: true
      end
    end
    resources :searches, only: [:index]
  end
end
