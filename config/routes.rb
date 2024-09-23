Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pages
      resources :comments
      resources :users
    end
  end
end