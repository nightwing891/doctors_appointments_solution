Rails.application.routes.draw do
  root 'courses#index'

  resources :users
  resources :doctors do
    resources :appointments
  end
end
