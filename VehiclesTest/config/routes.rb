Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :vehicle_models, only: %w[create]
      resources :vehicles, only: %w[index create]
    end
  end
end
