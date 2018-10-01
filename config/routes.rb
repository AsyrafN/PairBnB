Rails.application.routes.draw do
  resources :listings do
    resources :reservations, only: [:create]
  end

  resources :reservations, only: [:show]
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, only: [:show, :edit, :update]
  
    
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  post 'listings/search'
  
  get '/home' => "welcome#home"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'reservations/checkout'

  # resources :profile #update, edit, show

  # get "/saved" => "users#saved"

  # post "/profile" => "upload#create"

  # get "/listing" => "new_listing#new"

  # get "/listing" => "listings#selector", as: "listing_selector"
  get "/listing" => "listings#show"   

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
