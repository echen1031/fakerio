Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :internet do
        resources :emails, only: [:index]
      end
    end
  end
  devise_for :users

  root :to => "home#index"
end
