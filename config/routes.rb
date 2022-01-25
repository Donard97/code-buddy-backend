Rails.application.routes.draw do
  resources :reservations
  resources :meetings
  resources :meeting_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  resources :users do
    resources :user_details
  end
end
