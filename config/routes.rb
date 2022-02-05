Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"
  get 'users/login-register', to: 'users#login_register'
  
  resources :users do
    get 'meetings', to: 'user_details#meetings'
    resources :user_details
    resources :reservations
  end

  resources :meetings do 
    get 'reservations', to: 'meetings#reservations'
  end

  resources :meeting_types do
    get 'meetings', to: 'meeting_types#meetings'
  end
end
