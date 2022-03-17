Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :writers do
        resources :books
      end
      resources :books
    end
  end
end
