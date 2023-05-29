Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "notes#index"

  resources :notes
  resources :users, only: %i[ edit show update ]
end
