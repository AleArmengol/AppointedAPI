Rails.application.routes.draw do
  resources :waiting_lists
  resources :specialities
  resources :doctors
  resources :appointments
  resources :patients
  
  # post "/appointments/clone", to: "clone#appointments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end