Rails.application.routes.draw do
  get "/appointments/doctors_appointments_by_day", to: "appointments#doctors_appointments_by_day"
  get "/appointments/cancelled_appointments_by_doctor", to: "appointments#cancelled_appointments_by_doctor"

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
  resources :daily_presets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end