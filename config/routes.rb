Rails.application.routes.draw do

  resources :weekly_preset_daily_presets
  resources :weekly_presets
  resources :time_frames
  resources :daily_presets
  root "specialities#index"
  resources :specialities
  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end
end
