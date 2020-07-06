Rails.application.routes.draw do
  resources :waiting_lists
  resources :specialities
  resources :doctors
  resources :appointments
  resources :patients
  resources :weekly_presets
  resources :daily_presets
  resources :weekly_preset_daily_presets
  resources :appointment_dates, only: [:index]

  post "/appointments/set_daily_preset_to_dates"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end