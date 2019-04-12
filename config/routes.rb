Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
      root "static_pages#home"

      get "sessions/new"
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      get "/signup", to: "users#new"
      resources :users
  end
end
