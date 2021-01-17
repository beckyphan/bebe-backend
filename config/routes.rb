Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :destroy] do
        resources :bebes, only: [:index, :create, :show, :update, :destroy] do
          resources :days, only: [:index, :create] do
            resources :trackings, only: [:index, :create, :update, :destroy]
          end
        end
      end
    end
  end

  post 'api/v1/login', to: 'api/v1/users#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
