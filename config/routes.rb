Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :people, only: [:index]
      resources :companies, only: [:index]
      namespace :internet do
        resources :ip_addresses, only: [:index]
        resources :emails, only: [:index]
      end
    end
  end
  resources :purchases, only: [:new, :create]
  devise_for :users

  authenticated :user do
    root to: "dashboards#index", as: :user_dashboard
  end
  
  resources :dashboards, only: [:index]
  root :to => "home#index"
  get 'foo.json' => 'foo#index'
end
