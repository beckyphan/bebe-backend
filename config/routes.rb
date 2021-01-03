Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :bebes do
          resources :days do
            resources :trackings
          end
        end
      end
    end
  end

  post 'api/v1/login', to: 'api/v1/users#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
