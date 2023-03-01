Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscription_customers, only: [:create, :destroy]
      resources :customers do
        resources :subscriptions, only: [:index]
      end
    end
  end
end
