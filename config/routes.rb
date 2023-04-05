Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :skills
  resources :interests
end
