Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
      root "static_pages#home"

      get "sessions/new"
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      get "/signup", to: "users#new"
      resources :users
      resources :categories, only: %i(show index)
      resources :products, only: %i(index show)
      namespace :admin do
        resources :categories, except: %i(show index)
        resources :users, only: :destroy
      end
  end
end
