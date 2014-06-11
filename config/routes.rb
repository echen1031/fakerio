Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index]
      resources :company, only: [:index]
      namespace :internet do
        resources :ip_addresses, only: [:index]
        resources :emails, only: [:index]
      end
    end
  end
  devise_for :users

  root :to => "home#index"
end
