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
    get 'upload', to: 'data#upload_form', as: 'upload'
    post 'upload', to: 'data#upload_image', as: 'upload_image'
  end
end
