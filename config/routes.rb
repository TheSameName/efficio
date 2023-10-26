Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "public#index"

  get "home", to: "home#index"

  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  resources :sessions, only: %i[index show destroy]
  resource  :password, only: %i[edit update]

  namespace :identity do
    resource :email,              only: %i[edit update]
    resource :email_verification, only: %i[show create]
    resource :password_reset,     only: %i[new edit create update]
  end

  resource :invitation, only: %i[new create]
end
