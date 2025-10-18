Rails.application.routes.draw do
  root "coffees#index"
  resources :coffees

  # Admin authentication routes (secret path)
  # Access at: /brewmaster
  scope path: 'brewmaster', as: 'admin' do
    get 'login', to: 'admin/sessions#new', as: 'login'
    post 'login', to: 'admin/sessions#create'
    delete 'logout', to: 'admin/sessions#destroy', as: 'logout'

    # Data import (one-time use)
    get 'import', to: 'admin/data#import', as: 'import'
    get 'upload', to: 'admin/data#upload_form', as: 'upload'
    post 'upload', to: 'admin/data#upload_image', as: 'upload_image'
  end
end
