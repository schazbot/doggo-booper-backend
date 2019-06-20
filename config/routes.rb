Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]
  resources :dogs, only: [:index, :create, :destroy]
  resources :user_dogs, only: [:index, :create, :show]
end
