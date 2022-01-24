Rails.application.routes.draw do
  resources :reservations
  resources :meetings
  resources :user_details
  resources :meeting_types
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
