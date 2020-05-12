Rails.application.routes.draw do
  resources :waiting_lists
  resources :specialities
  resources :doctors
  root "doctors#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end