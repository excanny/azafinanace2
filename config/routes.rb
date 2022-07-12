Rails.application.routes.draw do
  resources :transactions
  resource :users, only: [:create]
  post "/login", to: "users#login"
end
