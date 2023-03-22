Rails.application.routes.draw do
  devise_for :users
  resources :municipes
  resource :addresses, only: %i[new create]

  root "home#index"
end
