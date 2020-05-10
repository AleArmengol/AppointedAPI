Rails.application.routes.draw do

<<<<<<< HEAD
  resources :doctor_calendars
=======
>>>>>>> e195d1a94fc2f6c2c7cacb64122958fea26a6b73
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
