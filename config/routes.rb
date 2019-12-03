Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create]
  resources :dogs, only: [:index, :create, :destroy, :update]
  resources :user_dogs, only: [:index, :create, :show]

  post "/signin", to: "users#signin"
  post "/signup", to: "users#create"
  get "/validate", to: "users#validate"
  get "/mydogs", to: "dogs#index"
end
