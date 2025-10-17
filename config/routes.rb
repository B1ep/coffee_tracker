Rails.application.routes.draw do
  root "coffees#index"
  resources :coffees

  # Admin authentication routes
  namespace :admin do
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: 'logout'

    # Data import (one-time use)
    get 'import', to: 'data#import', as: 'import'
  end
end
