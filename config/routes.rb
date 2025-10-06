Rails.application.routes.draw do
  root "coffees#index"
  resources :coffees
end
